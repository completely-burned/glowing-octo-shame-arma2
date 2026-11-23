# =============================================================
# Arma launch script
# Edit only the SETTINGS block below
# =============================================================

# ----------------------------- SETTINGS -----------------------------
$GameDir  = $PSScriptRoot
$Exe      = "Arma2OA.exe"

# Mods: paths relative to $GameDir, separated by ';'
$Mods     = ""

# Extra launch parameters (single string)
$Params   = "-showScriptErrors -maxMem=3071 -maxVRAM=6143 -maxFileCacheSize=4096 -enableHT -exThreads=7 -limitFPS=64 -hugePages -noFreezeCheck -setThreadCharacteristics -noSplash -noPause"

# --- CPU affinity (NATIVE Arma 3 parameters) ---
# -cpuAffinity = affinity mask of the whole process, hex, e.g. 0xFF = cores 1-8
# -cpuMainThreadAffinity = mask for the main (render) thread alone, e.g. 0x01 = core 1
# Use "auto" for defaults (engine auto detection), or set explicit masks.
# https://bitsum.com/tools/cpu-affinity-calculator
$CpuAffinity            = "0xFFF"
$CpuMainThreadAffinity  = "0xC00"

# -cpuCount: number of worker cores, minimum 2 (since patch 2.20).
# Note: -cpuCount overrides -enableHT if both are set.
# Leave "auto" to not pass the parameter at all.
$CpuCount = "12"

# Process priority: Idle | BelowNormal | Normal | AboveNormal | High
$Priority = "AboveNormal"
# --------------------------------------------------------------------

# --- Build argument list ---
$Args = @()

if ($Mods -ne "") {
    $Args += "-mod=$Mods"
}

if ($Params -ne "") {
    $Args += ($Params -split '\s+')
}

if ($CpuAffinity -ne "auto") {
    $Args += "-cpuAffinity=$CpuAffinity"
}

if ($CpuMainThreadAffinity -ne "auto") {
    $Args += "-cpuMainThreadAffinity=$CpuMainThreadAffinity"
}

if ($CpuCount -ne "auto") {
    $Args += "-cpuCount=$CpuCount"
}

# --- Compose command ---
#$CmdExe  = Join-Path $GameDir $Exe
$CmdExe  = $Exe

Write-Host ("Launch: {0} {1}" -f $CmdExe, ($Args -join " "))
Write-Host ("Priority: {0}" -f $Priority)

# только напечатать.
#exit 0

# --- Start ---
$Proc = Start-Process -FilePath $CmdExe -ArgumentList $Args `
    -PassThru

# TODO: Убрать конфликт с Affinity из Arma 3
if ($CpuAffinity -ne "auto") {
	$proc.ProcessorAffinity = [IntPtr][Convert]::ToInt64($CpuAffinity, 16)
}
if ($Priority -ne "Normal") {
	$proc.PriorityClass = $Priority
}
