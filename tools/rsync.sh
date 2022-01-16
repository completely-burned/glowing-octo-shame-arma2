#!/bin/bash

# a3 proton не работают символьные ссылки

DIR=$(dirname "${BASH_SOURCE[0]}")/..

OUT="${OUT:-$DIR/.build.out/rsync}"

for DIR in $(find $DIR -maxdepth 1 -type d); do
	if [ -f "${DIR}/mission.sqm" ]; then

		VERSION=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*".* .* .* v\(.*[[:digit:]]\).*/\1/' -e 's/\./\-/gi')
		SIDE=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*".* .* \(.*\) v.*".*/\1/')
		NAME=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*"\(.*\) .* .* v.*".*/\1/')
		MAP=$(echo ${DIR} | sed -e 's/.*\.\(.*\)/\1/')
		DLC=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*".* .* .* v.*[[:digit:]]\(.*\)".*/\1/' -e 's/\ /\-/gi')

		TMPDIRNAME="${NAME,,}-rsync-${SIDE,,}$DLC.${MAP,,}"

		MISSION=$OUT/$TMPDIRNAME

		mkdir -p $MISSION

		if [[ $NAME != *"compat"* ]]; then
			rsync --recursive --delete ${DIR}/../glowing-octo-shame-arma2/ $MISSION
			rsync --recursive --delete ${DIR}/* $MISSION
		fi
	fi
done
