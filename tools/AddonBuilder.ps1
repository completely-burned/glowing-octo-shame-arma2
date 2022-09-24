# Скрипт не готов, это только заготовка.
#
# Собирает только дебаг версию,
# ничем не отличающуюся от простого копирования файлов,
# кроме названия архива.
#
# Для запуска нужен установленный Arma 3 Tools.
# Запускается так..
# В оболочке WindowsPowerShell
# переходим в директорию tools, командой
# cd S:\git\glowing-octo-shame-arma2\tools
# И запускаем
# .\AddonBuilder.ps1 -out "G:\SteamLibrary\steamapps\common\Arma 2 Operation Arrowhead\MPMissions"
# или просто .\AddonBuilder.ps1, тогда файлы будут в ..\.build.out

# Параметры.
param ($out)

# Переменные.
$env_include=Resolve-Path "pbo_include.txt"
#$env_include="pbo_include.txt"
Write-Host "env_include: $env_include"

# Конечная директория.
if ($out -eq $null) {
	$env_out="..\.build.out"
}else{
	$env_out=$out
}
New-Item -Force -ItemType Directory -Path $env_out
$env_out=Resolve-Path $env_out
Write-Host "env_out: $env_out"

# Временная директория для сборки.
#$env_tmpdir = Join-Path $Env:Temp $(New-Guid)
$env_tmpdir = Join-Path $Env:Temp "glowing-octo-shame-arma2"
New-Item -Force -ItemType Directory -Path $env_tmpdir
Write-Host "env_tmpdir: $env_tmpdir"

# Поиск архиватора.
$AddonBuilderRegKey = "HKLM:\SOFTWARE\WOW6432Node\Bohemia Interactive\AddonBuilder"
$AddonBuilderExe = join-path -path (Get-ItemProperty $AddonBuilderRegKey)."path" -childpath (Get-ItemProperty $AddonBuilderRegKey)."exe"
Write-Host "AddonBuilderExe: $AddonBuilderExe"
#& $AddonBuilderExe -help

$list=(Get-ChildItem -Path "..\" -Filter "glowing-octo-shame-east*")
$list=$list+(Get-ChildItem -Path "..\" -Filter "glowing-octo-shame-west*")
$list=$list+(Get-ChildItem -Path "..\" -Filter "glowing-octo-shame-guer*")
$list=@("glowing-octo-shame-east.Chernarus","glowing-octo-shame-east.Takistan")
Write-Host "list: $list"
Foreach ($i in $list)
{
	# Временная директория для одной карты.
	$env_pre="$env_tmpdir\ps1-debug-$i"
	New-Item -Force -ItemType Directory -Path $env_pre
	$env_pre=Resolve-Path $env_pre
	Write-Host "env_pre: $env_pre"

	# Очистка временной директории карты.
	Remove-Item -Path $env_pre\* -Recurse
	# Копирование файлов карты.
	Copy-Item -Recurse -Path "..\$i\*" -Destination $env_pre
	Copy-Item -Recurse -Path "..\glowing-octo-shame-arma2\*" -Destination $env_pre


	# Упаковка.
	#Write-Host "AddonBuilder: $AddonBuilderExe $env_pre $env_out -clear -include=$env_include"
	& $AddonBuilderExe "$env_pre" "$env_out" -clear "-include=$env_include"
}
