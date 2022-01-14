#!/bin/bash

DIR=$(dirname "${BASH_SOURCE[0]}")/..

DIAG_LOG=false
while getopts "d" opt
	do
	case $opt in
	d) DIAG_LOG=true;;
	*);;
	esac
done


TMPDIR=$(mktemp -td glowing-octo-shame-arma2.XXXXX)
echo $TMPDIR

rsync --recursive --delete --no-perms $DIR/glowing-octo-shame* $TMPDIR/
echo $(ls $TMPDIR)

PRE=$TMPDIR/out
mkdir -p $PRE

OUT="${OUT:-$DIR/.build.out}"

if [ ! -d $OUT ]; then
	mkdir -p $OUT
fi

if $DIAG_LOG; then
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

		VERSION=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*".* .* .* v\(.*\)".*/\1/' -e 's/\./\-/gi')
		SIDE=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*".* .* \(.*\) v.*".*/\1/')
		NAME=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*"\(.*\) .* .* v.*".*/\1/')
		MAP=$(echo ${DIR} | sed -e 's/.*\.\(.*\)/\1/')

		TMPDIRNAME="${NAME,,}-${VERSION,,}-${SIDE,,}.${MAP,,}"


		MISSION=$TMPDIR/.build.tmp/$TMPDIRNAME

		mkdir -p $MISSION


		# cpmpat для a2 v1.11
		if [[ $NAME == *"compat"* ]]; then
			rsync --recursive --delete $TMPDIR/glowing-octo-shame-arma2/* $MISSION
			rsync --recursive --delete ${DIR}/* $MISSION
			find $MISSION -type f -exec sed -i "/^.*#define.*__A2OA__.*/d" {} \;
		else
			find $TMPDIR/glowing-octo-shame-arma2/ -mindepth 1 -maxdepth 1 -exec ln -sn {} $MISSION \;
			find ${DIR} -mindepth 1 -maxdepth 1 -exec ln -sn {} $MISSION \;
		fi

		if $DIAG_LOG; then
			sed -i "s/glowing-octo-shame/DEBUG glowing-octo-shame/" $MISSION/mission.sqm
		fi

		# если установлен gnu parallel можно запустить несколько комманд паралельно, предварительно их подготовив
		if [ -x "$(command -v parallel)" ]; then
			var_parallel+=("makepbo -M $MISSION 	$PRE/${NAME,,}$DEBUGPOSTFIX-${VERSION,,}-${SIDE,,}-makepbo.${MAP,,}.pbo")
			var_parallel+=("armake build --packonly --force $MISSION 	$PRE/${NAME,,}$DEBUGPOSTFIX-${VERSION,,}-${SIDE,,}-armake.${MAP,,}.pbo")
			var_parallel+=("armake2 pack -v $MISSION 	$PRE/${NAME,,}$DEBUGPOSTFIX-${VERSION,,}-${SIDE,,}-armake2.${MAP,,}.pbo")
		else
			makepbo -M $MISSION 	$PRE/${NAME,,}$DEBUGPOSTFIX-${VERSION,,}-${SIDE,,}-makepbo.${MAP,,}.pbo
			armake build --packonly --force $MISSION 	$PRE/${NAME,,}$DEBUGPOSTFIX-${VERSION,,}-${SIDE,,}-armake.${MAP,,}.pbo
			armake2 pack -v $MISSION 	$PRE/${NAME,,}$DEBUGPOSTFIX-${VERSION,,}-${SIDE,,}-armake2.${MAP,,}.pbo
		fi

		rsync -rLK $MISSION/* $PRE/${NAME,,}$DEBUGPOSTFIX-${VERSION,,}-${SIDE,,}-rsync.${MAP,,}

	fi
done

#gnu parallel
if [ ! -z "$var_parallel" ]; then
  parallel ::: "${var_parallel[@]}"
fi

find $PRE -type f -empty -print -delete

nice -n 19 ionice -c 3 mv $PRE/* $OUT

rm -rf $TMPDIR

# find $OUT -size 0 -delete

echo $OUT
