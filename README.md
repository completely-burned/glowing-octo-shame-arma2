glowing-octo-shame-arma2
==============================
Универсальная миссия для игры Arma 2: Operation Arrowhead и Arma 3.  
PVE бой с ботами сконцентрированный в одной точке.  

## About
Главное меню открыть можно нажав `0-8-` `BIS_MENU_GroupCommunication`.  
Эта миссия может быть воспроизведен на других картах Chernarus takistan utes и т.д.

## Build
 - ### linux
      ```bash
      # Установить
      # rsync git sed translit parallel
      # * Lingua-Translit
      #
      # и установить дополнительно, не обязательно
      # makepbo armake armake2
      #
      # В любом случае
      # должна будет появится после сборки папка rsync
      # в которой будут готовые для игры файлы.

      # Скачать код
      git clone --depth=1 https://github.com/completely-burned/glowing-octo-shame-arma2.git

      # Перейти в корень с кодами,
      # Не glowing-octo-shame-arma2/glowing-octo-shame-arma2/
      cd ./glowing-octo-shame-arma2/

      # Нужны права на запуск скрипта сборки
      chmod +x ./tools/build_pbo_linux.sh

      # Собрать
      ./tools/build_pbo_linux.sh
      exit 0 # готово, это выход
      # или
      OUT="/куда/поместитьPBOs/" ./tools/build_pbo_linux.sh

      # Файлы будут по умолчанию в arma-glowing-octo-shame
      # примерно такие...
      co_00_glowing-octo-shame-east-v0-0-4-852-armake.chernarus.pbo
      co_00_glowing-octo-shame-east-v0-0-4-852-rsync.chernarus/
      co_00_glowing-octo-shame-guer-v0-0-4-852-armake.chernarus.pbo
      co_00_glowing-octo-shame-guer-v0-0-4-852-rsync.chernarus/
      co_00_glowing-octo-shame-west-v0-0-4-852-armake.chernarus.pbo
      co_00_glowing-octo-shame-west-v0-0-4-852-rsync.chernarus/
      ```
 - ### windows
   - Строки содержащие `diag_log` нужно удалить,  
     иначе они будут активно записывать в лог файл,
     а игра тормозить.  
     Не знаю как это сделать MS Windows,  
     но если вы знаеете, можете мне сообщить.  

   - Скопируйте  
     недостающие файлы `Description.ext dir/ init.sqf manhattansetupAmbient.sqf stringtable.csv`  
     из папки `glowing-octo-shame-arma2/` в папки с назанием карты,  
     и соберите, опять [не знаю чем](https://community.bistudio.com/wiki/Community_Tools).

   - Можете просто запустить linux скрипт в Windows Subsystem for Linux или ~~Cygwin~~ (настолько дико тормозит что не работает) остальные вообще могут сломать Windows. В них не доступны makepbo, armake, armake2.  
