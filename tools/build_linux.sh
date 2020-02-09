#!/bin/bash

DIR=$(dirname "${BASH_SOURCE[0]}")/..

cd ${DIR}

if [ ! -d ${DIR}/.build.tmp/ ]; then
	mkdir ${DIR}/.build.tmp/
fi

if [ ! -d ${DIR}/.build.out/ ]; then
	mkdir ${DIR}/.build.out/
fi



for DIR in $(find ./ -maxdepth 1 -type d); do
	if [ -f "${DIR}/mission.sqm" ]; then
		VERSION=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*".* v\(.*\) .* .*".*/\1/' -e 's/\./\-/gi')
		SIDE=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*".* v.* .* \(.*\)".*/\1/')
		NAME=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*"\(.*\) v.* .* .*".*/\1/')
		MAP=$(echo ${DIR} | sed -e 's/.*\.\(.*\)/\1/')
		TMPDIRNAME="${NAME,,}-${SIDE,,}-${VERSION,,}.${MAP,,}"
		if [ -d ".build.tmp/${TMPDIRNAME}/" ]; then
			rm -rf ".build.tmp/${TMPDIRNAME}/*"
		else
			mkdir ".build.tmp/${TMPDIRNAME}/"
		fi
		find glowing-octo-shame-arma2/ -mindepth 1 -maxdepth 1 -exec ln -snf ../../{} ".build.tmp/${TMPDIRNAME}/" \;
		find ${DIR} -mindepth 1 -maxdepth 1 -exec ln -snf ../../{} ".build.tmp/${TMPDIRNAME}/" \;
		makepbo .build.tmp/${TMPDIRNAME}/ .build.out/${TMPDIRNAME}.pbo
	fi
done





