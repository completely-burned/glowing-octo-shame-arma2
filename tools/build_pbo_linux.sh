#!/bin/bash

# TODO: Нужно учитывать метаданные.

# Флаги запуска.
# ./tools/build_pbo_linux.sh -d собрать debug версию.
# -l добавит файл лицензии в архив.
DIAG_LOG=0
LICENSE=0
while getopts "dl" opt
	do
	case $opt in
	d) DIAG_LOG=1;;
	l) LICENSE=1;;
	*);;
	esac
done

# Нужен путь к корню проекта.
# TODO: Улучшить.
DIR=$(dirname "${BASH_SOURCE[0]}")/..

# Совместимость.
WINDOWS=0
case "$(uname -s)" in
	Darwin)
		echo 'Mac OS X'
		;;
	Linux)
		echo 'Linux'
		;;
	CYGWIN*|MINGW32*|MSYS*|MINGW*)
		echo 'MS Windows'
		WINDOWS=1
		;;
	*)
		echo 'Other OS'
		;;
esac

# В tmpfs сборка быстрее.
TMPDIR=$(mktemp -td glowing-octo-shame-arma2.XXXXX)
echo $TMPDIR

# Файл лицензии.
if [[ $LICENSE -gt 0 ]]
then
	rsync --recursive --delete --no-perms $DIR/*LICENSE* $TMPDIR/
fi
# Основные файлы.
rsync --recursive --delete --no-perms $DIR/glowing-octo-shame* $TMPDIR/
echo $(ls $TMPDIR)


PRE=$TMPDIR/out
mkdir -p $PRE

# OUT=/куда/поместить/собранные/pbo/ ./tools/build_pbo_linux.sh
OUT="${OUT:-$DIR/.build.out}"

if [[ ! -d ${OUT} ]]
then
	mkdir -p ${OUT}
fi

if [[ $DIAG_LOG -gt 0 ]]
then
	# debug версии уникальны, это добавит им hash в названии
	# FIXME: Измененные метаданные возможно приводят к сбою сервера.
	DEBUGPOSTFIX=($(tar -cf - $TMPDIR/glowing-octo-shame-arma2/ | sha1sum))
	DEBUGPOSTFIX="-debug-$DEBUGPOSTFIX"
	echo $DEBUGPOSTFIX
else
	DEBUGPOSTFIX=""
	# строки начинающиеся с diag_log нужны для отладки
	# они возможно снижают производительность
	# поэтому удаляем их
	echo "remove diag_log"
	find $TMPDIR -type f -exec sed -i "/^.*diag_log.*/d" {} \;
fi

if [[ ! -d $TMPDIR/.build.out ]]
then
	mkdir $TMPDIR/.build.out
fi

# "FDF CTF@ 24 Flag Rambos v1 beta"
# https://forums.bohemia.net/forums/topic/217676-mission-name-standard/
NAME="glowing-octo-shame"

for DIR in $(find $TMPDIR -maxdepth 1 -type d)
do
	if [[ -f "${DIR}/mission.sqm" ]]
	then
		# TODO: Оптимизировать.
		VERSION=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*".*glowing-octo-shame.* \(v.*[[:digit:]]\).*/\1/' -e 's/\./\-/gi')
		SIDE=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*".*glowing-octo-shame.* .* \(.*\) v.*".*/\1/')
		MAP=$(echo ${DIR} | sed -e 's/.*\.\(.*\)/\1/')
		DLC=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*"\(.*\)CO.*".*/\1/' -e 's/\ /_/gi')

		# Место подготовки файлов перед архивацией.
		TMPDIRNAME="${DLC,,}co_00_${NAME,,}-${SIDE,,}-${VERSION,,}.${MAP,,}"
		MISSION=$TMPDIR/.build.tmp/$TMPDIRNAME
		mkdir -p $MISSION
		echo $MISSION


		# cpmpat для a2 v1.11
		if [[ $DLC == *"compat"* ]]
		then
			rsync --recursive --delete --no-perms $TMPDIR/glowing-octo-shame-arma2/* $MISSION
			rsync --recursive --delete --no-perms ${DIR}/* $MISSION
			find $MISSION -type f -exec sed -i "/^.*#define.*__A2OA__.*/d" {} \;
		else
			# Символьные ссылки быстрее копирования, хотя при tmpfs это не значительно.
			#find $TMPDIR/glowing-octo-shame-arma2/ -mindepth 1 -maxdepth 1 -exec ln -sn {} $MISSION \;
			#find ${DIR} -mindepth 1 -maxdepth 1 -exec ln -sn {} $MISSION \;
			# Копирование.
			rsync --recursive --delete --no-perms $TMPDIR/glowing-octo-shame-arma2/* $MISSION
			rsync --recursive --delete --no-perms ${DIR}/* $MISSION
		fi

		if [[ $LICENSE -gt 0 ]]
		then
			rsync --recursive --delete --no-perms $TMPDIR/*LICENSE* $MISSION
		fi

		# Не всегда все файлы нужны.
		# version=11; <= Arma 2: Operation Arrowhead
		Z=$(grep version $MISSION/mission.sqm | head -n1)
		if [[ $Z == *"11"* ]]
		then
			Z=$MISSION/dir/arma3/config_groups.sqf
			rm $Z
		fi

		if [[ $DIAG_LOG -le 0 ]]
		then
			# Приставка DEBUG во внутриигровом меню.
			sed -i "s/\(.*briefingName.*\) DEBUG\(.*\)/\1\2/" $MISSION/mission.sqm
		fi

		if [[ $WINDOWS -le 0 ]]
		then
			# Если установлен gnu parallel можно запустить несколько комманд паралельно, предварительно их подготовив.
			if [[ -x "$(command -v parallel)" ]]
			then
				var_parallel+=("makepbo -M $MISSION 	$PRE/${DLC,,}co_00_${NAME,,}${DEBUGPOSTFIX}-${SIDE,,}-${VERSION,,}-makepbo.${MAP,,}.pbo")
				var_parallel+=("armake build --packonly --force $MISSION 	$PRE/${DLC,,}co_00_${NAME,,}${DEBUGPOSTFIX}-${SIDE,,}-${VERSION,,}-armake.${MAP,,}.pbo")
				var_parallel+=("armake2 pack -v $MISSION 	$PRE/${DLC,,}co_00_${NAME,,}${DEBUGPOSTFIX}-${SIDE,,}-${VERSION,,}-armake2.${MAP,,}.pbo")
			else
				makepbo -M $MISSION 	$PRE/${DLC,,}co_00_${NAME,,}${DEBUGPOSTFIX}-${SIDE,,}-${VERSION,,}-makepbo.${MAP,,}.pbo
				armake build --packonly --force $MISSION 	$PRE/${DLC,,}co_00_${NAME,,}${DEBUGPOSTFIX}-${SIDE,,}-${VERSION,,}-armake.${MAP,,}.pbo
				armake2 pack -v $MISSION 	$PRE/${DLC,,}co_00_${NAME,,}${DEBUGPOSTFIX}-${SIDE,,}-${VERSION,,}-armake2.${MAP,,}.pbo
			fi
		fi

		# Создаем безархивную версию на случай если архивация не удалась.
		rsync -rLK --delete --no-perms $MISSION/* $PRE/${DLC,,}co_00_${NAME,,}${DEBUGPOSTFIX}-${SIDE,,}-${VERSION,,}-rsync.${MAP,,}

	fi
done

#gnu parallel
if [[ ! -z "$var_parallel" ]]
then
	parallel ::: "${var_parallel[@]}"
fi

# Чиска архивов с нулевым размером, .. и такое бывает.
find $PRE -type f -empty -print -delete

# Перемещение.
# Используя rsync, чтобы не перезаписывать файлы
# если они частично присутствуют например на флешке.
rsync --recursive --delete --no-perms $PRE/ $OUT/

# Чистка tmpfs.
rm -rf $TMPDIR

# find $OUT -size 0 -delete

# Вывод местонахождения архивов.
# FIXME: Лучше выводить пути к каждому архиву.
echo $OUT
