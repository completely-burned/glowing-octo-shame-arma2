#!/bin/bash

# a3 proton не работают символьные ссылки

DIR_ROOT=$(dirname "${BASH_SOURCE[0]}")/..

OUT="${OUT:-${DIR_ROOT}/.build.out/rsync}"

NAME="glowing-octo-shame"

game="arma3"
for DIR in $(find ${DIR_ROOT}/maps/${game} -maxdepth 1 -type d); do
	if [ -f "${DIR}/mission.sqm" ]; then
		MAP=$(echo ${DIR} | sed -e 's/.*\.\(.*\)/\1/')
		TMP=$(grep briefingName ${DIR}/mission.sqm)
		#pbo_VERSION=$(echo ${TMP} | sed -e 's/.*".*gosa.* \(v.*[[:digit:]]\).*/\1/' -e 's/\./\-/gi')
		pbo_VERSION="debug-rsync"
		SIDE=$(echo ${TMP} | sed -e 's/.*".*gosa.* .* \(.*\) v.*".*/\1/')
		DLC2=$(echo ${TMP} | sed -e 's/.*"\(.*\)CO.*".*/\1/')
		DLC=$(echo "${DLC2}" | sed -e 's/\ /_/gi')

		TMPDIRNAME="${DLC,,}co_00_${NAME,,}-${game,,}-${SIDE,,}-${pbo_VERSION,,}.${MAP,,}"

		MISSION="${OUT}/${TMPDIRNAME}"

		mkdir -p "${MISSION}"
		if [[ $NAME != *"compat"* ]]; then
			rsync --recursive --delete --checksum "${DIR_ROOT}"/glowing-octo-shame-arma2/ "${MISSION}"/
			rsync --recursive --delete --checksum "${DIR}"/* "${MISSION}"/
		fi

		# find $MISSION -type f -exec sed -i '1s/^/#define __ARMA3__\n/' {} \;

	fi
done
