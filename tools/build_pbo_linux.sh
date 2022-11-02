#!/bin/bash

# TODO: Нужно учитывать метаданные.

# Флаги запуска.
# ./tools/build_pbo_linux.sh -d собрать debug версию.
# -l добавит файл лицензии в архив.
TORRENTFILE=0
DIAG_LOG=0
LICENSE=0
while getopts "dlt" opt
	do
	case $opt in
	t) TORRENTFILE=1;;
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

NAME="glowing-octo-shame"
# Финишное имя, стабильное,
# под него подстраиваться придется, т.е. оно не меняется,
# но имя миссии может поменяться, и это тоже,
# тем не менее, постараюсь его не менять.
FINITENAME="arma-${NAME}"

# В tmpfs сборка быстрее.
TMPDIR=$(mktemp -td ${FINITENAME}.XXXXX)
echo $TMPDIR

echo "Copying files to a temporary directory"
# Файл лицензии.
if [[ $LICENSE -gt 0 ]]
then
	rsync --recursive --no-perms $DIR/*LICENSE* $TMPDIR/
	rsync --recursive --no-perms $DIR/*authors* $TMPDIR/
fi
# Основные файлы.
rsync --recursive --no-perms $DIR/glowing-octo-shame* $TMPDIR/
echo $(ls $TMPDIR)


PRE=$TMPDIR/out
mkdir -p $PRE

# OUT=/куда/поместить/собранные/pbo/ ./tools/build_pbo_linux.sh
OUT="${OUT:-$DIR/${FINITENAME}}"

if [[ ! -d ${OUT} ]]
then
	mkdir -p ${OUT}
fi

if [[ $DIAG_LOG -gt 0 ]]
then
	# debug версии уникальны, это добавит им hash в названии
	# FIXME: Измененные метаданные возможно приводят к сбою сервера.
	echo "Calculate debug hash"
	DEBUGPOSTFIX=($(tar -cf - $TMPDIR/glowing-octo-shame-arma2/ | cksum))
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

for DIR in $(find $TMPDIR -maxdepth 1 -type d)
do
	if [[ -f "${DIR}/mission.sqm" ]]
	then
		echo "for ${DIR}"
		MAP=$(echo ${DIR} | sed -e 's/.*\.\(.*\)/\1/')
		TMP=$(grep briefingName ${DIR}/mission.sqm)
		VERSION=$(echo ${TMP} | sed -e 's/.*".*glowing-octo-shame.* \(v.*[[:digit:]]\).*/\1/' -e 's/\./\-/gi')
		SIDE=$(echo ${TMP} | sed -e 's/.*".*glowing-octo-shame.* .* \(.*\) v.*".*/\1/')
		DLC=$(echo ${TMP} | sed -e 's/.*"\(.*\)CO.*".*/\1/' -e 's/\ /_/gi')

		# Место подготовки файлов перед архивацией.
		TMPDIRNAME="${DLC,,}co_00_${NAME,,}-${SIDE,,}-${VERSION,,}.${MAP,,}"
		echo "Name ${TMPDIRNAME}"
		MISSION=$TMPDIR/.build.tmp/$TMPDIRNAME
		mkdir -p $MISSION
		echo $MISSION


		echo "Copying core files"
		# cpmpat для a2 v1.11
		if [[ $DLC == *"compat"* ]]
		then
			rsync --recursive --no-perms $TMPDIR/glowing-octo-shame-arma2/* $MISSION
			rsync --recursive --no-perms ${DIR}/* $MISSION
			find $MISSION -type f -exec sed -i "/^.*#define.*__A2OA__.*/d" {} \;
		else
			# Символьные ссылки быстрее копирования, хотя при tmpfs это не значительно.
			#find $TMPDIR/glowing-octo-shame-arma2/ -mindepth 1 -maxdepth 1 -exec ln -sn {} $MISSION \;
			#find ${DIR} -mindepth 1 -maxdepth 1 -exec ln -sn {} $MISSION \;
			# Копирование.
			rsync --recursive --no-perms $TMPDIR/glowing-octo-shame-arma2/* $MISSION
			rsync --recursive --no-perms ${DIR}/* $MISSION
		fi

		if [[ $LICENSE -gt 0 ]]
		then
			echo "Copying LICENSE"
			rsync --recursive --no-perms $TMPDIR/*LICENSE* $MISSION
			rsync --recursive --no-perms $TMPDIR/*authors* $MISSION
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
			echo "Removing DEBUG from briefingName ${TMPDIRNAME}"
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
				echo "Pack ${TMPDIRNAME}"
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
	echo "Pack pbo's"
	parallel ::: "${var_parallel[@]}"
fi

echo "Deleting empty pbo's"
find $PRE -type f -empty -iname "*.pbo" -print -delete

# Torrent файл.
if [[ $TORRENTFILE -gt 0 ]]
then
	echo "Torrent file create"
	TORRENT_TMPDIR=$(mktemp -td ${NAME}-TORRENT_TMPDIR.XXXXX)
	TORRENT_TMPDIR=${TORRENT_TMPDIR}/${FINITENAME}
	mkdir ${TORRENT_TMPDIR}
	echo "Torrent directory ${TORRENT_TMPDIR}"
	find ${PRE} -maxdepth 1 -type f -iname "*.pbo" -print -exec cp {} ${TORRENT_TMPDIR}/ \;
	ctorrent -t -u "udp://localhost:6969" -s "${PRE}/${FINITENAME}.torrent" ${TORRENT_TMPDIR}/
fi

# Используя rsync --checksum, чтобы не перезаписывать файлы
# если они частично присутствуют например на флешке.
echo "Move files to destination"
rsync --recursive --no-perms --checksum $PRE/ $OUT/

echo "Deleting temp directories"
rm -rf ${TORRENT_TMPDIR}
rm -rf $TMPDIR

# find $OUT -size 0 -delete

# FIXME: Лучше выводить пути к каждому архиву.
echo "Done. Files to..."
echo $OUT
