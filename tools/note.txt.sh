#!/bin/sh
echo "в этом файле заметки, можете открыть его в текстовом редакторе"
exit 1

####################################################################
## заметки ## заметки ## заметки ## заметки ## заметки ## заметки ##
####################################################################

cd /media/rsync_or_usb_dir

# релиз
OUT="~/a2-server/mpmissions/" ./tools/build_pbo_linux.sh

# дебаг
rm ~/a2oa-server-private/mpmissions/* ; OUT="~/a2oa-server-private/mpmissions/" ./tools/build_pbo_linux.sh -d

# #define __ARMA3__ необходимо установить самостоятельно до версии 2.02
find ./ -type f -exec sed -i '1s/^/#define __ARMA3__\n/' {} \;

find ~/*/mpmissions/ -not -iname '*v0-0-5-942*' \( -iname '*glowing-octo-shame*.pbo' -or -iname '*gosa*.pbo' \) -print -delete
