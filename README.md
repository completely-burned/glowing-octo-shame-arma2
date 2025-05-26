glowing-octo-shame-arma2
==============================
Универсальная миссия для игры Arma 2: Operation Arrowhead и Arma 3.  
PVE бой с ботами сконцентрированный в одной точке.  

## Description
Осторожно, alpha-версия! Запустив этот сценарий у игрока может начать всё гореть и бомбить, монитор может упасть со стола, а ноутбук сломаться пополам, а его самого в итоге могут увезти на кладбище. В общем-то сценарий больше для тех кто с ним знаком, так что "я вас не звал, и не нойте, мне и без вас хорошо в общем-то, но я и не против".

Здесь нет сюжета, нет истории, здесь игрок должен убивать, убивать, убивать, убивать и убивать, ну и еще можно при этом просто выжить, а еще можно спасти товарищей если они у вас еще есть. Если вам нравится крушить врагов всеми доступными способами, когда вокруг кровь, крики, огонь и смерь, если вы по характеру как меч просто делаете свою работу, то возможно сценарий может вам подойти. *Зависит от настроек и модификаций.
Для первого знакомства со сценарием рекомендую в первый раз выбрать любую роль кроме crewman т.е. не пилот и не член экипажа и не высшего офицера и не гражданского и не наблюдателя, потому-что они возрождаются на базе, а магазин я недоделал и базе не уделил внимания и сценарий соответственно тоже не готов, приоритет был в случайном методе возрождения и в самом сражении.


## About
Главное меню открыть можно нажав `0-8-` `BIS_MENU_GroupCommunication`.  
Эта миссия может быть воспроизведен на других картах Chernarus takistan utes и т.д.

## Download
 - [releases](../../releases)


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

      # Собрать
      bash ./tools/build_pbo_linux.sh
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
