#!/bin/bash

# IN=/git/glowing-octo-shame-arma2 OUT=/opt/steamcmd/a2oa-server-debug/mpmissions bash ./tools/symlink.sh
# Срипт создает директории с символьными ссылками готовые для debug миссии.
# Но сервер не работает должным образом,
#  возможно он не распознает что файлы изменились.
# Пригодится если нет рабочего установленного pbo архиватора.
# Клиент Arma 3 запущеный в GE-Proton10-3 не находит миссии созданные таким способом.

NAME="glowing-octo-shame"
NAME_SHORT="gosa"
LN="ln -sn"

IN="${IN:-/git/glowing-octo-shame-arma2}"
OUT="${OUT:-$IN/.build.out/symlink}"

GAMES="${GAMES:- arma3 a2oa a2}"
coredir="${IN}/glowing-octo-shame-arma2"

mkdir "${OUT}"

coredirs=( $(cd "${coredir}"; find -L -mindepth 1 -type d) )
corefiles=( $(cd "${coredir}"; find -L -mindepth 1 -type f) )

for game in ${GAMES}; do
	for DIR in $(find "${IN}"/maps/${game} -maxdepth 1 -type d); do
		if [ -f "${DIR}/mission.sqm" ]; then

			#VERSION=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*".* .* .* v\(.*\)".*/\1/' -e 's/\./\-/gi')
			#SIDE=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*".* .* \(.*\) v.*".*/\1/')
			#NAME=$(grep briefingName ${DIR}/mission.sqm | sed -e 's/.*"\(.*\) .* .* v.*".*/\1/')
			#MAP=$(echo ${DIR} | sed -e 's/.*\.\(.*\)/\1/')

			MAP=$(echo ${DIR} | sed -e 's/.*\.\(.*\)/\1/')
			TMP=$(grep briefingName ${DIR}/mission.sqm)
			pbo_VERSION=$(echo ${TMP} | sed -e 's/.*".*gosa.* \(v.*[[:digit:]]\).*/\1/' -e 's/\./\-/gi')
			SIDE=$(echo ${TMP} | sed -e 's/.*".*gosa.* .* \(.*\) v.*".*/\1/')
			DLC2=$(echo ${TMP} | sed -e 's/.*"\(.*\)CO.*".*/\1/')
			DLC=$(echo "${DLC2}" | sed -e 's/\ /_/gi')

			if [[ ${SIDE,,} == "multi" ]]
			then
				dir_name="${PRE}/${DLC,,}${NAME_SHORT,,}-${game,,}-debug-SM.${MAP,,}"
				dir_mission="${OUT}"/$dir_name

				mkdir "${dir_mission}"
				ln -s "${DIR}/mission.sqm" "${dir_mission}/mission.sqm"

				# FIXME: Очень медленный код.
				for i in "${coredirs[@]}"
				do
					f="${dir_mission}/${i,,}"
					if [ ! -d "${f}" ]
					then
						mkdir "${f}"
					fi
				done
				for i in "${corefiles[@]}"
				do
					f="${dir_mission}/${i,,}"
					if [ ! -f "${f}" ] && [ ! -L "${f}" ]
					then
						ln -s "${coredir}/${i}" "${f}"
					fi
				done
			fi
		fi
	done
done
