#!/bin/bash

DIR=$(dirname "${BASH_SOURCE[0]}")/..

cd ${DIR}

#rm -rf ${DIR}/tmp/*

if [ ! -d ${DIR}/.build.tmp/ ]; then
	mkdir ${DIR}/.build.tmp/
fi

if [ ! -d ${DIR}/.build.out/ ]; then
	mkdir ${DIR}/.build.out/
fi



for DIR in $(find ./ -maxdepth 1 -type d); do
	if [ -f "${DIR}/mission.sqm" ]; then
		VERSION=$(grep briefingName ${DIR}/mission.sqm | 	sed -e 's/.*".* v\(.*\) .* .*".*/\1/' -e 's/\./\-/gi')
		SIDE=$(grep briefingName ${DIR}/mission.sqm | 		sed -e 's/.*".* v.* .* \(.*\)".*/\1/')
		NAME=$(grep briefingName ${DIR}/mission.sqm | 		sed -e 's/.*"\(.*\) v.* .* .*".*/\1/')
		if [ -d ".build.tmp/${DIR,,}/" ]; then
			rm -rf ".build.tmp/${DIR,,}/*"
		else
			mkdir ".build.tmp/${DIR,,}/"
		fi
		find glowing-octo-shame-arma2/ -mindepth 1 -maxdepth 1 -exec ln -snf ../../{} ".build.tmp/${DIR,,}/" \;
		find ${DIR} -mindepth 1 -maxdepth 1 -exec ln -snf ../../{} ".build.tmp/${DIR,,}/" \;
		makepbo .build.tmp/${DIR,,}/ .build.out/${NAME}-${SIDE}-${VERSION}.pbo
	fi
done





