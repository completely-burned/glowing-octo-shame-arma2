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

V=$(grep briefingName ${DIR}/glowing-octo-shame-east.Chernarus/mission.sqm | sed -e 's/.*glowing-octo-shame v\(.*\) .*/\1/' -e 's/\./\-/gi')


# Takistan
ln -s ./../glowing-octo-shame.Takistan ${DIR}/tmp/glowing-octo-shame.Takistan

makepbo -NM ${DIR}/tmp/glowing-octo-shame.Takistan ${DIR}/out/glowing-octo-shame-${V}.takistan.pbo


# Zargabad
ln -s ./../glowing-octo-shame.Zargabad ${DIR}/tmp/glowing-octo-shame.Zargabad

makepbo -NM ${DIR}/tmp/glowing-octo-shame.Zargabad ${DIR}/out/glowing-octo-shame-${V}.zargabad.pbo


# Desert_E
ln -s ./../glowing-octo-shame.Desert_E ${DIR}/tmp/glowing-octo-shame.Desert_E

makepbo -NM ${DIR}/tmp/glowing-octo-shame.Desert_E ${DIR}/out/glowing-octo-shame-${V}.desert_e.pbo


# Chernarus
ln -s ./../glowing-octo-shame.Chernarus ${DIR}/tmp/glowing-octo-shame.Chernarus

makepbo -NM ${DIR}/tmp/glowing-octo-shame.Chernarus ${DIR}/out/glowing-octo-shame-${V}.chernarus.pbo


# utes
ln -s ./../glowing-octo-shame.utes ${DIR}/tmp/glowing-octo-shame.utes

makepbo -NM ${DIR}/tmp/glowing-octo-shame.utes ${DIR}/out/glowing-octo-shame-${V}.utes.pbo


# ProvingGrounds_PMC
ln -s ./../glowing-octo-shame.ProvingGrounds_PMC ${DIR}/tmp/glowing-octo-shame.ProvingGrounds_PMC

makepbo -NM ${DIR}/tmp/glowing-octo-shame.ProvingGrounds_PMC ${DIR}/out/glowing-octo-shame-${V}.provinggrounds_pmc.pbo


# Shapur_BAF
ln -s ./../glowing-octo-shame.Shapur_BAF ${DIR}/tmp/glowing-octo-shame.Shapur_BAF

makepbo -NM ${DIR}/tmp/glowing-octo-shame.Shapur_BAF ${DIR}/out/glowing-octo-shame-${V}.shapur_baf.pbo


# Bootcamp_ACR
ln -s ./../glowing-octo-shame.Bootcamp_ACR ${DIR}/tmp/glowing-octo-shame.Bootcamp_ACR

makepbo -NM ${DIR}/tmp/glowing-octo-shame.Bootcamp_ACR ${DIR}/out/glowing-octo-shame-${V}.bootcamp_acr.pbo


# Mountains_ACR
ln -s ./../glowing-octo-shame.Mountains_ACR ${DIR}/tmp/glowing-octo-shame.Mountains_ACR

makepbo -NM ${DIR}/tmp/glowing-octo-shame.Mountains_ACR ${DIR}/out/glowing-octo-shame-${V}.mountains_acr.pbo


# Woodland_ACR
ln -s ./../glowing-octo-shame.Woodland_ACR ${DIR}/tmp/glowing-octo-shame.Woodland_ACR

makepbo -NM ${DIR}/tmp/glowing-octo-shame.Woodland_ACR ${DIR}/out/glowing-octo-shame-${V}.woodland_acr.pbo

