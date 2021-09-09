#!/bin/bash

DIR=$(dirname "${BASH_SOURCE[0]}")/..

cd ${DIR}

if [ ! -d .build.tmp ]; then
	mkdir .build.tmp
fi

if [ ! -d .build.out ]; then
	mkdir .build.out
fi



for DIR in $(find ./ -maxdepth 1 -type d); do
	if [ -f "${DIR}/mission.sqm" ]; then

		VERSION=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*".* .* .* v\(.*\)".*/\1/' -e 's/\./\-/gi')
		SIDE=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*".* .* \(.*\) v.*".*/\1/')
		NAME=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*"\(.*\) .* .* v.*".*/\1/')
		MAP=$(echo ${DIR} | sed -e 's/.*\.\(.*\)/\1/')

		TMPDIRNAME="${NAME,,}-${VERSION,,}-${SIDE,,}.${MAP,,}"

		if [ -d ".build.tmp/${TMPDIRNAME}/" ]; then
			rm -rf ".build.tmp/${TMPDIRNAME}/*"
		else
			mkdir ".build.tmp/${TMPDIRNAME}/"
		fi

		# символьные ссылки чтобы не копировать шурша диском
		#find glowing-octo-shame-arma2/ -mindepth 1 -maxdepth 1 -exec ln -snf ../../{} ".build.tmp/${TMPDIRNAME}/" \;
		#find ${DIR} -mindepth 1 -maxdepth 1 -exec ln -snf ../../{} ".build.tmp/${TMPDIRNAME}/" \;

		# делаем rsync чтобы изменять копии файлов не затронув git директорию перед сборкой .pbo
		rsync --recursive glowing-octo-shame-arma2/* .build.tmp/${TMPDIRNAME}/
		rsync --recursive ${DIR}/* .build.tmp/${TMPDIRNAME}/

		# строки начинающиеся с diag_log нужны для отладки
		# они возможно снижают производительность
		# поэтому удаляем их
		find .build.tmp/${TMPDIRNAME}/ -type f -exec sed -i "/^.*diag_log.*/d" {} \;

		# cpmpat для a2 v1.11
		if [[ $NAME == *"compat"* ]]; then
			find .build.tmp/${TMPDIRNAME}/ -type f -exec sed -i "/^.*#define.*__A2OA__.*/d" {} \;
		fi

		# если установлен gnu parallel можно запустить несколько комманд паралельно, предварительно их подготовив
		if [ -x "$(command -v parallel)" ]; then
			var_parallel+=("makepbo -M .build.tmp/${TMPDIRNAME}/ .build.out/${NAME,,}-${VERSION,,}-${SIDE,,}-makepbo.${MAP,,}.pbo")
			var_parallel+=("armake build --packonly --force .build.tmp/${TMPDIRNAME}/ .build.out/${NAME,,}-${VERSION,,}-${SIDE,,}-armake.${MAP,,}.pbo")
			var_parallel+=("armake2 pack -v .build.tmp/${TMPDIRNAME}/ .build.out/${NAME,,}-${VERSION,,}-${SIDE,,}-armake2.${MAP,,}.pbo")
		else
			makepbo -M .build.tmp/${TMPDIRNAME}/ .build.out/${NAME,,}-${VERSION,,}-${SIDE,,}-makepbo.${MAP,,}.pbo
			armake build --packonly --force .build.tmp/${TMPDIRNAME}/ .build.out/${NAME,,}-${VERSION,,}-${SIDE,,}-armake.${MAP,,}.pbo
			armake2 pack -v .build.tmp/${TMPDIRNAME}/ .build.out/${NAME,,}-${VERSION,,}-${SIDE,,}-armake2.${MAP,,}.pbo
		fi

	fi
done

#gnu parallel
if [ ! -z "$var_parallel" ]; then
  parallel ::: "${var_parallel[@]}"
fi
