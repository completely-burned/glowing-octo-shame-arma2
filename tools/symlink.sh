#!/bin/bash

# Срипт создает директории с символьными ссылками готовые для debug миссии.
# Но сервер не работает должным образом,
#  возможно он не распознает что файлы изменились.
# Пригодится если нет рабочего установленного pbo архиватора.
# OUT=/opt/steamcmd/a2oa-server-debug/mpmissions ./tools/symlink.sh

DIR=$(dirname "${BASH_SOURCE[0]}")/..

OUT="${OUT:-$DIR/.build.out/symlink}"

for DIR in $(find $DIR -maxdepth 1 -type d); do
	if [ -f "${DIR}/mission.sqm" ]; then

		VERSION=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*".* .* .* v\(.*\)".*/\1/' -e 's/\./\-/gi')
		SIDE=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*".* .* \(.*\) v.*".*/\1/')
		NAME=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*"\(.*\) .* .* v.*".*/\1/')
		MAP=$(echo ${DIR} | sed -e 's/.*\.\(.*\)/\1/')

		TMPDIRNAME="${NAME,,}-symlink-${SIDE,,}.${MAP,,}"

		MISSION=$OUT/$TMPDIRNAME

		mkdir -p $MISSION


		if [[ $NAME != *"compat"* ]]; then
			find $DIR/../glowing-octo-shame-arma2/ -mindepth 1 -maxdepth 1 -exec ln -snr {} $MISSION \;
			find $DIR -mindepth 1 -maxdepth 1 -exec ln -snr {} $MISSION \;
		fi
	fi
done
