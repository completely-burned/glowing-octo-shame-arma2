#!/bin/bash

DIR=$(dirname "${BASH_SOURCE[0]}")/..

cd ${DIR}

rm -rf ${DIR}/tmp/*

if [ ! -d ${DIR}/tmp ]; then
	mkdir ${DIR}/tmp
fi

if [ ! -d ${DIR}/out ]; then
        mkdir ${DIR}/out
fi

V=$(grep briefingName ${DIR}/glowing-octo-shame-east.Chernarus/mission.sqm | sed -e 's/.*glowing-octo-shame v\(.*\) .* .*/\1/' -e 's/\./\-/gi')


# Takistan
ln -s ./../glowing-octo-shame-east.Takistan ${DIR}/tmp/glowing-octo-shame-east.Takistan

makepbo -NM ${DIR}/tmp/glowing-octo-shame-east.Takistan ${DIR}/out/glowing-octo-shame-east-${V}.takistan.pbo

ln -s ./../glowing-octo-shame-guer.Takistan ${DIR}/tmp/glowing-octo-shame-guer.Takistan
makepbo -NM ${DIR}/tmp/glowing-octo-shame-guer.Takistan ${DIR}/out/glowing-octo-shame-guer-${V}.takistan.pbo


# Zargabad
ln -s ./../glowing-octo-shame-east.Zargabad ${DIR}/tmp/glowing-octo-shame-east.Zargabad

makepbo -NM ${DIR}/tmp/glowing-octo-shame-east.Zargabad ${DIR}/out/glowing-octo-shame-east-${V}.zargabad.pbo


# Desert_E
ln -s ./../glowing-octo-shame-east.Desert_E ${DIR}/tmp/glowing-octo-shame-east.Desert_E

makepbo -NM ${DIR}/tmp/glowing-octo-shame-east.Desert_E ${DIR}/out/glowing-octo-shame-east-${V}.desert_e.pbo


# Chernarus
ln -s ./../glowing-octo-shame-east.Chernarus ${DIR}/tmp/glowing-octo-shame-east.Chernarus

makepbo -NM ${DIR}/tmp/glowing-octo-shame-east.Chernarus ${DIR}/out/glowing-octo-shame-east-${V}.chernarus.pbo

ln -s ./../glowing-octo-shame-guer.Chernarus ${DIR}/tmp/glowing-octo-shame-guer.Chernarus
makepbo -NM ${DIR}/tmp/glowing-octo-shame-guer.Chernarus ${DIR}/out/glowing-octo-shame-guer-${V}.chernarus.pbo


# utes
ln -s ./../glowing-octo-shame-east.utes ${DIR}/tmp/glowing-octo-shame-east.utes

makepbo -NM ${DIR}/tmp/glowing-octo-shame-east.utes ${DIR}/out/glowing-octo-shame-east-${V}.utes.pbo


# ProvingGrounds_PMC
ln -s ./../glowing-octo-shame-east.ProvingGrounds_PMC ${DIR}/tmp/glowing-octo-shame-east.ProvingGrounds_PMC

makepbo -NM ${DIR}/tmp/glowing-octo-shame-east.ProvingGrounds_PMC ${DIR}/out/glowing-octo-shame-east-${V}.provinggrounds_pmc.pbo


# Shapur_BAF
ln -s ./../glowing-octo-shame-east.Shapur_BAF ${DIR}/tmp/glowing-octo-shame-east.Shapur_BAF

makepbo -NM ${DIR}/tmp/glowing-octo-shame-east.Shapur_BAF ${DIR}/out/glowing-octo-shame-east-${V}.shapur_baf.pbo


# Bootcamp_ACR
ln -s ./../glowing-octo-shame-east.Bootcamp_ACR ${DIR}/tmp/glowing-octo-shame-east.Bootcamp_ACR

makepbo -NM ${DIR}/tmp/glowing-octo-shame-east.Bootcamp_ACR ${DIR}/out/glowing-octo-shame-east-${V}.bootcamp_acr.pbo


# Mountains_ACR
ln -s ./../glowing-octo-shame-east.Mountains_ACR ${DIR}/tmp/glowing-octo-shame-east.Mountains_ACR

makepbo -NM ${DIR}/tmp/glowing-octo-shame-east.Mountains_ACR ${DIR}/out/glowing-octo-shame-east-${V}.mountains_acr.pbo


# Woodland_ACR
ln -s ./../glowing-octo-shame-east.Woodland_ACR ${DIR}/tmp/glowing-octo-shame-east.Woodland_ACR

makepbo -NM ${DIR}/tmp/glowing-octo-shame-east.Woodland_ACR ${DIR}/out/glowing-octo-shame-east-${V}.woodland_acr.pbo

