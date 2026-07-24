# TODO: Нужно учитывать метаданные.

# Флаги запуска.
# Объявление параметров скрипта
param(
    # .\tools\build_pbo.ps1 -DebugMode:$false -AddLicense:$true
    [Parameter(Mandatory=$false)]
    [switch]$DebugMode = $true,
    
    [Parameter(Mandatory=$false)]
    [switch]$AddLicense = $true,
    
    [Parameter(Mandatory=$false)]
    [switch]$Compression = $false,
    
    [Parameter(Mandatory=$false)]
    [switch]$CreateArchive = $true,
    
    [Parameter(Mandatory=$false)]
    [switch]$CreateTorrent = $true,

    [Parameter(Mandatory=$false)]
    [string[]]$Games = @("arma3", "a2oa", "a2"),

    # .\script.ps1 -OUT "C:\путь\к\выходным\файлам"
    [string]$OUT
)

# Проверка установленных флагов
if ($DebugMode) {
    Write-Host "DebugMode"
}

if ($Compression) {
  #  Write-Host "Включено сжатие"
}

if ($CreateArchive) {
  #  Write-Host "Создаётся архив"
}

if ($CreateTorrent) {
   # Write-Host "Создаётся торрент-файл"
}

# Получаем директорию скрипта
$scriptPath = Split-Path -Parent $PSScriptRoot
Write-Host "scriptPath $scriptPath"
# Получаем путь на уровень выше
#$DIR = Resolve-Path (Join-Path $scriptPath "..")
$DIR = (Get-Item -Path $scriptPath).FullName
Write-Host "DIR $DIR"

$NAME = "glowing-octo-shame"
$NAME_SHORT = "gosa"
# Финишное имя, стабильное,
# под него подстраиваться придется, т.е. оно не меняется,
# но имя миссии может поменяться, и это тоже,
# тем не менее, постараюсь его не менять.
$FINITENAME = "arma-" + $NAME
Write-Host "FINITENAME $FINITENAME"

# FIXME: В tmpfs сборка быстрее.
try {
    # Работаем с временной директорией
    $TMPDIR = [System.IO.Path]::GetTempPath()
    #$TMPDIR = Join-Path $TMPDIR "glowing-octo-shame-arma2"
    $TMPDIR = [System.IO.Path]::Combine($TMPDIR, [System.IO.Path]::GetRandomFileName())
    
    New-Item -ItemType Directory -Path $TMPDIR -Force
    Write-Host "TMPDIR $TMPDIR"

	Write-Host "Copying files to a temporary directory"

    $sourceDir = Join-Path $TMPDIR "glowing-octo-shame-arma2"
    # Проверяем значение переменной LICENSE
    if ($AddLicense) {
            New-Item -ItemType Directory -Path $sourceDir -Force
            # Копируем файлы лицензии
            Copy-Item -Path "$DIR\*LICENSE*" -Destination "$sourceDir" -Recurse -Force
            # Копируем файлы авторов
            Copy-Item -Path "$DIR\*authors*" -Destination "$sourceDir" -Recurse -Force
    }

	# Основные файлы.
    $escapedDir = [regex]::Escape($DIR)
    $items = Get-ChildItem -Path $DIR -Recurse | Where-Object {
        ($_.FullName -match "^$escapedDir\\glowing-octo-shame" -or
        $_.FullName -match "^$escapedDir\\maps\\")
    }
    foreach ($item in $items) {
        #Write-Host "item.FullName: $item.FullName"
        # Формируем относительный путь
        $relativePath = $item.FullName.Replace($DIR + "\", "")
        # Преобразуем путь в нижний регистр
        $lowercaseRelativePath = $relativePath.ToLower()
        # Формируем полный путь назначения
        $destinationFullPath = Join-Path $TMPDIR $lowercaseRelativePath
        #Write-Host "relativePath: $relativePath"
        #Write-Host "lowercaseRelativePath: $lowercaseRelativePath"
        #Write-Host "destinationFullPath: $destinationFullPath"
        
        if ($item.PSIsContainer) {
            # Создаем директорию, если она не существует
            if (-not (Test-Path $destinationFullPath)) {
                New-Item -ItemType Directory -Path $destinationFullPath -Force
            }
        } else {
            # Копируем файл
            if (-not (Test-Path $destinationFullPath)) {
                #try {
                    # Пытаемся создать жесткую ссылку
                    #New-Item -ItemType HardLink -Path $destinationFullPath -Target $item.FullName -ErrorAction Stop
                #} catch {
                    # Если не получилось - копируем обычным способом
                    Copy-Item -Path $item.FullName -Destination $destinationFullPath -Force
                #}
            }
        }
    }

    $PRE = "$TMPDIR/out"
	New-Item -ItemType Directory -Path $PRE -Force

	# .\script.ps1 -OUT "C:\путь\к\выходным\файлам"
	if ([string]::IsNullOrEmpty($OUT)) {
	    $OUT = Join-Path $DIR $FINITENAME
	}
	if (-not (Test-Path $OUT)) {
	    #New-Item -ItemType Directory -Path $OUT -Force
	}
	Write-Host "OUT $OUT"

	# Проверка переменной GITHUB_REF_NAME
	if ([string]::IsNullOrEmpty($env:GITHUB_REF_NAME)) {
	    # Если переменная пуста, используем значение VERSION или "latest"
	    $VERSION = if ([string]::IsNullOrEmpty($VERSION)) { "latest" } else { $VERSION }
	} else {
	    # Если переменная задана, используем её значение
	    $VERSION = $env:GITHUB_REF_NAME
	}

	# Альтернативный вариант с использованием тернарного оператора
	# $VERSION = [string]::IsNullOrEmpty($env:GITHUB_REF_NAME) ? ($VERSION ?? "latest") : $env:GITHUB_REF_NAME

	# Пример использования:
	Write-Host "version $VERSION"


	if ($DebugMode) {
	    Write-Host "Calculate debug hash"
	    
	    try {
            # Получаем хеш для debug версии
            #$hash = "powershell"
            $hash = Get-Date -Format "yyyyMMddHHmmssfff"
            
            $DEBUGPOSTFIX = "-debug-$hash"
            Write-Host $DEBUGPOSTFIX
	    } catch {
            Write-Error "Ошибка при вычислении хеша: $_"
            $DEBUGPOSTFIX = ""
	    }
	} else {
	    $DEBUGPOSTFIX = ""

	    Write-Host "Delete non ASCII strings"
	    # Удаляем не-ASCII символы
	    Get-ChildItem -Path $TMPDIR -Recurse -File | 
	    Where-Object { 
            $_.Name -notmatch '\.csv$' -and 
            $_.Name -notmatch '\.xml$' -and 
            $_.Name -notmatch '\.md$' 
	    } | ForEach-Object {
            (Get-Content $_.FullName) | 
            Where-Object { $_ -match '^[\x00-\x7F]*$' } | 
            Set-Content $_.FullName
	    }

	    Write-Host "Delete diag_log strings"
	    # Удаляем строки с diag_log
	    Get-ChildItem -Path $TMPDIR -Recurse -File | 
	    ForEach-Object {
            (Get-Content $_.FullName) | 
            Where-Object { $_ -notmatch '^.*diag_log.*$' } | 
            Set-Content $_.FullName
	    }
	}

    foreach ($game in $GAMES) {
        #TODO: LICENSE
    
        # Создаем временную директорию для core файлов
        $tmp_game = Join-Path $TMPDIR "core_$game"
        
        # Создаем директорию если её не существует
        New-Item -ItemType Directory -Path $tmp_game -Force

        Write-Host "tmp_game $tmp_game "

        # Копируем файлы из исходной директории
        $items = Get-ChildItem -Path $sourceDir -Recurse
        foreach ($item in $items) {
            $relativePath = $item.FullName.Replace($sourceDir + "\", "")
            $lowercaseRelativePath = $relativePath.ToLower()
            $destinationFullPath = Join-Path $tmp_game $lowercaseRelativePath
            
            if ($item.PSIsContainer) {
               New-Item -ItemType Directory -Path $destinationFullPath -Force
            } else {
                try {
                    New-Item -ItemType HardLink -Path $destinationFullPath -Target $item.FullName -ErrorAction Stop
                } catch {
                    Copy-Item -Path $item.FullName -Destination $destinationFullPath -Force
                }
            }
        }

        # Обработка совместимости для a2 v1.11
        if ($game -eq "a2") {
            # Ищем все файлы и удаляем строки с #define __A2OA__
            Get-ChildItem -Path $tmp_game -Recurse -File | 
            ForEach-Object {
                $originalContent = Get-Content $_.FullName
                $filteredContent = $originalContent | 
                    Where-Object { $_ -notmatch '^.*#define.*__A2OA__.*$' }
                # Проверяем, изменилось ли содержимое
                if ($filteredContent -join "`n" -ne $originalContent -join "`n") {
                    # Создаем временный файл
                    $tempFile = [System.IO.Path]::GetTempFileName()
                    try {
                        $filteredContent | Set-Content $tempFile
                        # Если содержимое изменилось, заменяем оригинальный файл
                        Move-Item -Path $tempFile -Destination $_.FullName -Force
                    } finally {
                        Remove-Item $tempFile -ErrorAction SilentlyContinue
                    }
                }
            }
        }

        # Получаем список директорий в maps/$game
        $mapDirectories = Get-ChildItem -Path "$TMPDIR\maps\$game" -Directory -Depth 0
        
        foreach ($DIR in $mapDirectories) {
            # Проверяем наличие файла mission.sqm
            $sqmPath = Join-Path -Path $DIR.FullName -ChildPath "mission.sqm"
            if (Test-Path $sqmPath) {
                Write-Host "test $($DIR.FullName)"
                
                (Get-Content -Path $sqmPath -Encoding UTF8) | 
                Where-Object { 
                    $_ -notmatch '^.*skill.*$' 
                } | Set-Content -Path $sqmPath -Encoding UTF8

                # Получаем MAP (последняя часть пути после точки)
                $MAP = ($DIR -split '\.')[ -1 ]
                #$MAP = (Split-Path $DIR -Leaf)

                # Читаем строку с briefingName
                $TMP = (Get-Content $sqmPath | Select-String -Pattern 'briefingName').Line

                # Извлекаем версию
                $pbo_VERSION = if ($TMP -match '".*gosa.* (v\d+\.\d+\.\d+\.\d+) .*"') {
                    $matches[1] -replace '\.', '-'
                }

                # Извлекаем сторону
                $SIDE = if ($TMP -match '".*gosa.* (.*) v\d+\.\d+\.\d+\.\d+ .*"') {
                    $matches[1]
                }

                # Извлекаем DLC (часть перед CO)
                $DLC2 = if ($TMP -match '"(.* )CO .*"') {
                    $matches[1]
                }

                # Обрабатываем DLC: убираем пробелы и заменяем на подчеркивания
                $DLC = if ($DLC2) {
                    $DLC2 -replace '\s', '_'
                } else {
                    ''
                }


                # Формируем имя временной директории
                $TMPDIRNAME = "{0}co_00_{1}-{2}-{3}-{4}.{5}" -f `
                    $DLC.ToLower(), `
                    $NAME_SHORT.ToLower(), `
                    $game.ToLower(), `
                    $SIDE.ToLower(), `
                    $pbo_VERSION.ToLower(), `
                    $MAP.ToLower()

                Write-Host "Name $TMPDIRNAME"

                # Формируем полный путь к директории миссии
                $MISSION = Join-Path $TMPDIR "build" | Join-Path -ChildPath $TMPDIRNAME

                # Создаем директорию
                New-Item -ItemType Directory -Path $MISSION -Force | Out-Null

                Write-Host "created $MISSION"

                $items = Get-ChildItem -Path $tmp_game -Recurse
                foreach ($item in $items) {
                    $relativePath = $item.FullName.Replace($tmp_game + "\", "")
                    $lowercaseRelativePath = $relativePath.ToLower()
                    $destinationFullPath = Join-Path $MISSION $lowercaseRelativePath
                    
                    if ($item.PSIsContainer) {
                    New-Item -ItemType Directory -Path $destinationFullPath -Force
                    } else {
                        try {
                            New-Item -ItemType HardLink -Path $destinationFullPath -Target $item.FullName -ErrorAction Stop
                        } catch {
                            Copy-Item -Path $item.FullName -Destination $destinationFullPath -Force
                        }
                    }
                }
                $items = Get-ChildItem -Path $DIR.FullName -Recurse
                foreach ($item in $items) {
                    $relativePath = $item.FullName.Replace($DIR.FullName + "\", "")
                    $lowercaseRelativePath = $relativePath.ToLower()
                    $destinationFullPath = Join-Path $MISSION $lowercaseRelativePath
                    
                    if ($item.PSIsContainer) {
                    New-Item -ItemType Directory -Path $destinationFullPath -Force
                    } else {
                        try {
                            New-Item -ItemType HardLink -Path $destinationFullPath -Target $item.FullName -ErrorAction Stop
                        } catch {
                            Copy-Item -Path $item.FullName -Destination $destinationFullPath -Force
                        }
                    }
                }

                if (-not $DebugMode) {
                    # Путь к файлу mission.sqm
                    $missionFile = Join-Path $MISSION "mission.sqm"

                    # Читаем содержимое файла
                    $content = Get-Content $missionFile

                    # Удаляем DEBUG из строки briefingName
                    $updatedContent = $content | ForEach-Object {
                        if ($_ -match 'briefingName') {
                            # Используем регулярное выражение для удаления DEBUG
                            $_ -replace '(.*briefingName.*) DEBUG(.*)', '$1$2'
                        } else {
                            $_
                        }
                    }

                    # Сохраняем изменения
                    $updatedContent | Set-Content $missionFile

                    Write-Host "DEBUG deleted in briefingName $missionFile"
                }

                # Проверка значения SIDE
                if ($SIDE.ToLower() -eq "multi") {
                    $binarize = $true
                    # Удаление include из Description.ext
                    Write-Host "delete include in description.ext $MISSION"
                    
                    # Поиск и обработка файлов Description.ext
                    Get-ChildItem -Path $MISSION -Recurse -Filter 'description.ext' |
                    ForEach-Object {
                        $originalContent = Get-Content $_.FullName
                        
                        # Создаем временный файл
                        $tempFile = [System.IO.Path]::GetTempFileName()
                        try {
                            # Фильтруем содержимое
                            $filteredContent = $originalContent | 
                                Where-Object { 
                                    $_ -notmatch '^.*#include.*mission.sqm.*$' 
                                }
                            
                            # Сохраняем во временный файл
                            $filteredContent | Set-Content $tempFile
                            
                            # Сравниваем содержимое
                            if ($filteredContent -join "`n" -ne $originalContent -join "`n") {
                                # Если изменилось - заменяем оригинальный файл
                                Move-Item -Path $tempFile -Destination $_.FullName -Force
                            }
                        } finally {
                            # Удаляем временный файл
                            Remove-Item $tempFile -ErrorAction SilentlyContinue
                        }
                    }
                } else {
                    $binarize = $false
                }

                # Формируем префикс файла
                $filename_prefix = "$($DLC.ToLower())co_00_$($NAME_SHORT.ToLower())-$($game.ToLower())$DEBUGPOSTFIX-$($SIDE.ToLower())-$($pbo_VERSION.ToLower())"

                # Пример использования
                #Write-Host "filename_prefix $filename_prefix"

                # Формируем полное имя PBO-файла
                #$pbo_filename = Join-Path $PRE "$(Split-Path $filename_prefix -Leaf)-powershell.$($MAP.ToLower()).pbo"

                # Альтернативный вариант формирования полного пути
                # $pbo_filename = "$filename_prefix-powershell.$($MAP.ToLower()).pbo"

                # Вывод результата
                #Write-Host "pbo_filename $pbo_filename"

                # AddonBuilder
                # Путь к разделу реестра
                $AddonBuilderRegKey = "HKLM:\SOFTWARE\WOW6432Node\Bohemia Interactive\AddonBuilder"

                # Получаем путь и имя исполняемого файла
                    # Получаем значение path из реестра
                    $path = (Get-ItemProperty -Path $AddonBuilderRegKey).path
                    
                    # Получаем значение exe из реестра
                    $exe = (Get-ItemProperty -Path $AddonBuilderRegKey).exe
                    
                    # Формируем полный путь к исполняемому файлу
                    $AddonBuilderExe = Join-Path -Path $path -ChildPath $exe
                    
                    # Выводим результат
                    Write-Host "path AddonBuilder: $AddonBuilderExe"

                # Дополнительная проверка существования файла
                if (Test-Path $AddonBuilderExe) {
                    Write-Host "found AddonBuilder"

                    $AddonBuilderTemp = Join-Path $TMPDIR "AddonBuilderTemp"
                    New-Item -ItemType Directory -Path $AddonBuilderTemp -Force

                    $content = "*.*"
                    $filePath = Join-Path $TMPDIR "pbo_include.txt"
                    Set-Content -Path $filePath -Value $content -Encoding UTF8

                    $pbo_filename_ab = Join-Path $PRE "$(Split-Path $filename_prefix -Leaf)-addonbuilder.$($MAP.ToLower())"
                    Move-Item -Path "$MISSION" -Destination "$pbo_filename_ab"
                    #if ($binarize) {
	                    & $AddonBuilderExe "$pbo_filename_ab" "$PRE" -clear "-include=$filePath" -temp="$AddonBuilderTemp"
                    #} else {
	                    #& $AddonBuilderExe "$pbo_filename_ab" "$PRE" -clear "-include=$filePath" -temp="$AddonBuilderTemp" -packonly
                    #}
                    Move-Item -Path "$pbo_filename_ab" -Destination "$MISSION"
                } else {
                    Write-Warning "Файл AddonBuilder не найден по указанному пути"
                }
            }
        }
    }

    New-Item -ItemType Directory -Path $OUT -Force
    Move-Item -Path "$PRE\*.pbo" -Destination "$OUT" -Force

	if ($CreateArchive) {
        if (Get-Module -Name 7Zip4Powershell -ListAvailable) {
            Compress-7Zip -Path "$TMPDIR\build\" -ArchiveFileName "$OUT\${FINITENAME}_${VERSION}.7z"
        } else {
            Compress-Archive `
                -Path "$TMPDIR\build\*" `
                -DestinationPath "$OUT\${FINITENAME}_${VERSION}.zip" `
                -Force
        }
    }

} finally {
	Write-Host "Deleting temp directories"
    # Очищаем временную директорию
    if (Test-Path $TMPDIR) {
        Remove-Item $TMPDIR -Recurse -Force -ErrorAction SilentlyContinue
    }
}

# find $OUT -size 0 -delete

# FIXME: Лучше выводить пути к каждому архиву.
#Write-Host "Done. Files to..."
Write-Host $OUT
