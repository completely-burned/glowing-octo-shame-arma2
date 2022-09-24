#!/bin/bash

# нужен путь к корню проекта
# TODO: улучшить
DIR=$(dirname "${BASH_SOURCE[0]}")/..

# флаги запуска
# ./tools/build_pbo_linux.sh -d собрать debug версию
DIAG_LOG=false
LICENSE=false
while getopts "dl" opt
	do
	case $opt in
	d) DIAG_LOG=true;;
	l) LICENSE=true;;
	*);;
	esac
done


# в tmpfs сборка быстрее
TMPDIR=$(mktemp -td glowing-octo-shame-arma2.XXXXX)
echo $TMPDIR

# Файл лицензии.
if $LICENSE; then
	cp $DIR/*LICENSE* $TMPDIR/
fi
# Основные файлы.
rsync --recursive --delete --no-perms $DIR/glowing-octo-shame* $TMPDIR/
echo $(ls $TMPDIR)


PRE=$TMPDIR/out
mkdir -p $PRE

# OUT=/куда/поместить/собранные/pbo/ ./tools/build_pbo_linux.sh
OUT="${OUT:-$DIR/.build.out}"

if [[ ! -d ${OUT} ]]; then
	mkdir -p ${OUT}
fi

if $DIAG_LOG; then
	# debug версии уникальны, это добавит им hash в названии
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

if [ ! -d $TMPDIR/.build.out ]; then
	mkdir $TMPDIR/.build.out
fi

# FDF CTF@ 24 Flag Rambos v1 beta
# https://forums.bohemia.net/forums/topic/217676-mission-name-standard/
NAME="glowing-octo-shame"

for DIR in $(find $TMPDIR -maxdepth 1 -type d); do
	if [ -f "${DIR}/mission.sqm" ]; then
		VERSION=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*".*glowing-octo-shame.* \(v.*[[:digit:]]\).*/\1/' -e 's/\./\-/gi')
		SIDE=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*".*glowing-octo-shame.* .* \(.*\) v.*".*/\1/')
		MAP=$(echo ${DIR} | sed -e 's/.*\.\(.*\)/\1/')
		DLC=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*"\(.*\)CO.*".*/\1/' -e 's/\ /_/gi')

		# место подготовки файлов перед архивацией
		TMPDIRNAME="${DLC,,}co_00_${NAME,,}-${SIDE,,}-${VERSION,,}.${MAP,,}"
		MISSION=$TMPDIR/.build.tmp/$TMPDIRNAME
		mkdir -p $MISSION
		echo $MISSION


		# cpmpat для a2 v1.11
		if [[ $DLC == *"compat"* ]]; then
			rsync --recursive --delete $TMPDIR/glowing-octo-shame-arma2/* $MISSION
			rsync --recursive --delete ${DIR}/* $MISSION
			find $MISSION -type f -exec sed -i "/^.*#define.*__A2OA__.*/d" {} \;
		else
			# символьные ссылки быстрее копирования, хотя при tmpfs это не значительно
			#find $TMPDIR/glowing-octo-shame-arma2/ -mindepth 1 -maxdepth 1 -exec ln -sn {} $MISSION \;
			#find ${DIR} -mindepth 1 -maxdepth 1 -exec ln -sn {} $MISSION \;
			# копирование
			rsync --recursive --delete $TMPDIR/glowing-octo-shame-arma2/* $MISSION
			rsync --recursive --delete ${DIR}/* $MISSION
		fi

		cp $TMPDIR/*LICENSE* $MISSION

		# не всегда все файлы нужны
		# version=11; <= Arma 2: Operation Arrowhead
		Z=$(grep version $MISSION/mission.sqm | head -n1)
		if [[ $Z == *"11"* ]]; then
			Z=$MISSION/dir/arma3/config_groups.sqf
			rm $Z
		fi

		if [[ $DIAG_LOG == false ]]
		then
			# приставка DEBUG во внутриигровом меню
			sed -i "s/\(.*briefingName.*\) DEBUG\(.*\)/\1\2/" $MISSION/mission.sqm
		fi

		# если установлен gnu parallel можно запустить несколько комманд паралельно, предварительно их подготовив
		if [ -x "$(command -v parallel)" ]; then
			var_parallel+=("makepbo -M $MISSION 	$PRE/${DLC,,}co_00_${NAME,,}${DEBUGPOSTFIX}-${SIDE,,}-${VERSION,,}-makepbo.${MAP,,}.pbo")
			var_parallel+=("armake build --packonly --force $MISSION 	$PRE/${DLC,,}co_00_${NAME,,}${DEBUGPOSTFIX}-${SIDE,,}-${VERSION,,}-armake.${MAP,,}.pbo")
			var_parallel+=("armake2 pack -v $MISSION 	$PRE/${DLC,,}co_00_${NAME,,}${DEBUGPOSTFIX}-${SIDE,,}-${VERSION,,}-armake2.${MAP,,}.pbo")
		else
			makepbo -M $MISSION 	$PRE/${DLC,,}co_00_${NAME,,}${DEBUGPOSTFIX}-${SIDE,,}-${VERSION,,}-makepbo.${MAP,,}.pbo
			armake build --packonly --force $MISSION 	$PRE/${DLC,,}co_00_${NAME,,}${DEBUGPOSTFIX}-${SIDE,,}-${VERSION,,}-armake.${MAP,,}.pbo
			armake2 pack -v $MISSION 	$PRE/${DLC,,}co_00_${NAME,,}${DEBUGPOSTFIX}-${SIDE,,}-${VERSION,,}-armake2.${MAP,,}.pbo
		fi

		# создаем без архивную версию на случай если архивация не удалась
		rsync -rLK $MISSION/* $PRE/${DLC,,}co_00_${NAME,,}${DEBUGPOSTFIX}-${SIDE,,}-${VERSION,,}-rsync.${MAP,,}

	fi
done

#gnu parallel
if [ ! -z "$var_parallel" ]; then
	parallel ::: "${var_parallel[@]}"
fi

# чиска архивов с нулевым размером, .. и такое бывает
find $PRE -type f -empty -print -delete

# перемещение
mv $PRE/* $OUT

# чистка tmpfs
rm -rf $TMPDIR

# find $OUT -size 0 -delete

# вывод местонахождения архивов
# FIXME: лучше выводить пути к каждому архиву
echo $OUT
