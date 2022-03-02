glowing-octo-shame-arma2
==============================
миссия для игры Arma 2: Operation Arrowhead

## About
pve бой с ботами в сконцентрированный в одной точке

главное меню открыть можно нажав `0-8-` `BIS_MENU_GroupCommunication`

эта миссия может быть воспроизведен на других картах Chernarus takistan utes и т.д.

## Build
 - ### linux
      ```bash
      # скачать код
      git clone --depth=1 https://github.com/completely-burned/glowing-octo-shame-arma2.git
      
      # перейти в корень с кодами
      cd ./glowing-octo-shame-arma2/

      # установить 
      # rsync
      # и дополнительно, не обязательно
      # makepbo
      # armake
      # armake2
      # 
      # в любом случае 
      # должна будет появится после сборки папка rsync
      # в которой будут готовые для игры файлы

      # нужны права на запуск скрипта сборки
      chmod +x ./tools/build_pbo_linux.sh

      # собрать
      ./tools/build_pbo_linux.sh
      # или 
      OUT="/tmp/куда/поместитьPBOs/" ./tools/build_pbo_linux.sh
      
      exit 0 # это выход
      # файлы будут в ./.build.out/ по умолчанию
      # примерно такие
      glowing-octo-shame-0-0-3-820-east-armake.takistan.pbo
      glowing-octo-shame-0-0-3-820-east-armake.utes.pbo
      glowing-octo-shame-0-0-3-820-east-rsync.takistan/
      glowing-octo-shame-0-0-3-820-east-rsync.utes/
      glowing-octo-shame-0-0-3-820-west-armake.bootcamp_acr.pbo
      glowing-octo-shame-0-0-3-820-west-armake.chernarus.pbo
      glowing-octo-shame-0-0-3-820-west-rsync.bootcamp_acr/
      glowing-octo-shame-0-0-3-820-west-rsync.chernarus/
      ```
 - ### windows
   - Строки содержащие `diag_log` нужно удалить,  
     иначе они будут активно записывать в лог файл, и тормозить,  
   
     как это сделать wondows, я не знаю,  
     но если вы знаеете, можете мне сообщить  
   
   - Скопируйте  
     недостающие файлы из папки `glowing-octo-shame-arma2/` в папки с назанием карты,  
     и соберите, опять я не знаю чем

## Other

https://github.com/completely-burned/glowing-octo-shame-arma2/issues/129

https://discord.gg/cc3ewg3
