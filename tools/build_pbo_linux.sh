#!/bin/bash

# нужен путь к корню проекта
# TODO: улучшить
DIR=$(dirname "${BASH_SOURCE[0]}")/..

# флаги запуска
# ./tools/build_pbo_linux.sh -d собрать debug версию
DIAG_LOG=false
while getopts "d" opt
	do
	case $opt in
	d) DIAG_LOG=true;;
	*);;
	esac
done


# в tmpfs сборка быстрее
TMPDIR=$(mktemp -td glowing-octo-shame-arma2.XXXXX)
echo $TMPDIR

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



for DIR in $(find $TMPDIR -maxdepth 1 -type d); do
	if [ -f "${DIR}/mission.sqm" ]; then

		# TODO: плохо понимаю этот sed
		VERSION=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*".* .* .* v\(.*[[:digit:]]\).*/\1/' -e 's/\./\-/gi')
		SIDE=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*".* .* \(.*\) v.*".*/\1/')
		NAME=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*"\(.*\) .* .* v.*".*/\1/')
		MAP=$(echo ${DIR} | sed -e 's/.*\.\(.*\)/\1/')
		DLC=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*".* .* .* v.*[[:digit:]]\(.*\)".*/\1/' -e 's/\ /\-/gi')


		# место подготовки файлов перед архивацией
		TMPDIRNAME="${NAME,,}-${VERSION,,}-${SIDE,,}${DLC,,}.${MAP,,}"
		MISSION=$TMPDIR/.build.tmp/$TMPDIRNAME
		mkdir -p $MISSION


		# cpmpat для a2 v1.11
		if [[ $NAME == *"compat"* ]]; then
			rsync --recursive --delete $TMPDIR/glowing-octo-shame-arma2/* $MISSION
			rsync --recursive --delete ${DIR}/* $MISSION
			find $MISSION -type f -exec sed -i "/^.*#define.*__A2OA__.*/d" {} \;
		else
			# символьные ссылки быстрее копирования, хотя при tmpfs это не значительно
			find $TMPDIR/glowing-octo-shame-arma2/ -mindepth 1 -maxdepth 1 -exec ln -sn {} $MISSION \;
			find ${DIR} -mindepth 1 -maxdepth 1 -exec ln -sn {} $MISSION \;
		fi

		if $DIAG_LOG; then
			# приставка DEBUG во внутриигровом меню
			sed -i "s/glowing-octo-shame/DEBUG glowing-octo-shame/" $MISSION/mission.sqm
		fi

		# если установлен gnu parallel можно запустить несколько комманд паралельно, предварительно их подготовив
		if [ -x "$(command -v parallel)" ]; then
			var_parallel+=("makepbo -M $MISSION 	$PRE/${NAME,,}$DEBUGPOSTFIX-${VERSION,,}-${SIDE,,}${DLC,,}-makepbo.${MAP,,}.pbo")
			var_parallel+=("armake build --packonly --force $MISSION 	$PRE/${NAME,,}$DEBUGPOSTFIX-${VERSION,,}-${SIDE,,}${DLC,,}-armake.${MAP,,}.pbo")
			var_parallel+=("armake2 pack -v $MISSION 	$PRE/${NAME,,}$DEBUGPOSTFIX-${VERSION,,}-${SIDE,,}${DLC,,}-armake2.${MAP,,}.pbo")
		else
			makepbo -M $MISSION 	$PRE/${NAME,,}$DEBUGPOSTFIX-${VERSION,,}-${SIDE,,}${DLC,,}-makepbo.${MAP,,}.pbo
			armake build --packonly --force $MISSION 	$PRE/${NAME,,}$DEBUGPOSTFIX-${VERSION,,}-${SIDE,,}${DLC,,}-armake.${MAP,,}.pbo
			armake2 pack -v $MISSION 	$PRE/${NAME,,}$DEBUGPOSTFIX-${VERSION,,}-${SIDE,,}${DLC,,}-armake2.${MAP,,}.pbo
		fi

		# создаем без архивную версию на случай если архивация не удалась
		rsync -rLK $MISSION/* $PRE/${NAME,,}$DEBUGPOSTFIX-${VERSION,,}-${SIDE,,}${DLC,,}-rsync.${MAP,,}

	fi
done

#gnu parallel
if [ ! -z "$var_parallel" ]; then
	parallel ::: "${var_parallel[@]}"
fi

# чиска архивов с нулевым размером, .. и такое бывает
find $PRE -type f -empty -print -delete

# перемещение
# TODO: приоритеты нужны лишь для публичного не debug сервера
nice -n 19 ionice -c 3 mv $PRE/* $OUT

# чистка tmpfs
rm -rf $TMPDIR

# find $OUT -size 0 -delete

# вывод местонахождения архивов
# FIXME: лучше выводить пути к каждому архиву
echo $OUT
