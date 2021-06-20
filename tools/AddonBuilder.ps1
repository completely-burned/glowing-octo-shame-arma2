# скрипт не готов, это только заготовка

New-Item -Force -ItemType Directory -Path "..\.build.tmp"
New-Item -Force -ItemType Directory -Path "..\.build.out"

$env_pbo=Resolve-Path ..\.build.out\
$env_includes=Resolve-Path .\pbo_include.txt

New-Item -Force -ItemType Directory -Path ..\.build.tmp\glowing-octo-shame-east-dev.chernarus\

$env_pre=Resolve-Path ..\.build.tmp\glowing-octo-shame-east-dev.chernarus\

Remove-Item -Path ..\.build.tmp\glowing-octo-shame-east-dev.chernarus\* -Recurse

Copy-Item -Recurse -Path "..\glowing-octo-shame-east.Chernarus\*" -Destination $env_pre
Copy-Item -Recurse -Path "..\glowing-octo-shame-arma2\*" -Destination $env_pre

$AddonBuilderRegKey = "HKLM:\SOFTWARE\WOW6432Node\Bohemia Interactive\AddonBuilder"

$AddonBuilderExe = join-path -path (Get-ItemProperty $AddonBuilderRegKey)."path" -childpath (Get-ItemProperty $AddonBuilderRegKey)."exe"

& $AddonBuilderExe $env_pre $env_pbo -clear -include="$env_includes"
