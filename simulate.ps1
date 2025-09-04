<#
.SYNOPSIS
PowerShell Wrapper zur Installation des Atomic Red Team Frameworks mit vollständigem Atomics Download inklusive Defender-Ausnahme,
Execution Policy Setup, interaktiver Auswahl von umfangreichen Angriffsszenarien (je 15-20 Techniques) und strukturierter Protokollierung.
#>

# Logfunktion: schreibt Zeitstempel und Zeilen in Logdatei
function Write-Log {
    param(
        [string]$Message,
        [string]$LogFile
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $Message" | Out-File -FilePath $LogFile -Encoding UTF8 -Append
}

# Defender Ausnahme hinzufügen zum Verhindern des Löschens
function Add-DefenderExclusion {
    Write-Host "Füge Windows Defender Ausnahme für C:\AtomicRedTeam hinzu..." -ForegroundColor Yellow
    try {
        if (Get-Command Add-MpPreference -ErrorAction SilentlyContinue) {
            Add-MpPreference -ExclusionPath "C:\AtomicRedTeam" 
            Write-Host "Ausnahme hinzugefügt." -ForegroundColor Green
        }
        else {
            Write-Warning "Befehl Add-MpPreference nicht verfügbar. Bitte Defender Ausnahmen manuell setzen."
        }
    }
    catch {
        Write-Warning "Fehler beim Hinzufügen der Defender Ausnahme: $_"
    }
}

function Set-ExecutionPolicyIfNeeded {
    $currentPolicy = Get-ExecutionPolicy -Scope CurrentUser
    if ($currentPolicy -ne 'RemoteSigned' -and $currentPolicy -ne 'Unrestricted') {
        Write-Host "Setze Execution Policy auf RemoteSigned für CurrentUser..." -ForegroundColor Yellow
        Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force
    }
    else {
        Write-Host "Execution Policy ist kompatibel: $currentPolicy" -ForegroundColor Green
    }
}

function Install-AtomicRedTeamWithAtomics {
    Write-Host "Installiere Atomic Red Team Framework mit Atomics…" -ForegroundColor Cyan

    $installerUrl = "https://raw.githubusercontent.com/redcanaryco/invoke-atomicredteam/master/install-atomicredteam.ps1"
    $scriptPath = Join-Path $env:TEMP "install-atomicredteam.ps1"
    Invoke-WebRequest -Uri $installerUrl -OutFile $scriptPath -UseBasicParsing

    . $scriptPath
    Install-AtomicRedTeam -getAtomics -Force -Verbose

    $atomicsFolder = "C:\AtomicRedTeam\atomics"
    if (Test-Path $atomicsFolder) {
        Write-Host "Atomics erfolgreich installiert unter $atomicsFolder" -ForegroundColor Green
    }
    else {
        Write-Warning "Atomics-Ordner konnte nicht gefunden werden. Installation möglicherweise unvollständig."
    }
}


function Run-Scenario {
    param(
        [string]$scenarioName,
        [string[]]$tests,
        [string]$logFile,
        [string]$installDir = "C:\AtomicRedTeam"
    )
    Write-Host "`nStarte Angriffsszenario: $scenarioName" -ForegroundColor Magenta
    Write-Log -Message "Starte Angriffsszenario: $scenarioName" -LogFile $logFile

    $moduleSubDir = Get-ChildItem -Path $installDir -Directory | Where-Object { $_.Name -like "invoke-atomicredteam*" } | Select-Object -First 1

    if ($null -eq $moduleSubDir)
    {
        Write-Error "AtomicRedTeam Modulverzeichnis nicht gefunden im Pfad $installDir"
        return
    }

    $modulePath = Join-Path $moduleSubDir.FullName "Invoke-AtomicRedTeam.psd1"

    try {
        Import-Module -Name $modulePath -ErrorAction Stop -Force
    }
    catch {
        Write-Host "Fehler beim Importieren des AtomicRedTeam Moduls: $_" -ForegroundColor Red
        return
    }

    foreach ($t in $tests)
    {
        Write-Host "Führe Atomic Test $t aus..." -ForegroundColor Cyan
        Write-Log -Message "----- Starte Test $t -----" -LogFile $logFile
        try {
            $output = Invoke-AtomicTest -AtomicTechnique $t -ErrorAction Stop -Verbose | Out-String
            Write-Log -Message $output -LogFile $logFile
            Write-Host "Test $t erfolgreich ausgeführt." -ForegroundColor Green
            Write-Log -Message "Test $t erfolgreich." -LogFile $logFile
        }
        catch {
            $errMsg = $_.Exception.Message
            Write-Host ("Fehler bei Test {0}: {1}" -f $t, $errMsg) -ForegroundColor Red
            Write-Log -Message ("Fehler bei Test {0}: {1}" -f $t, $errMsg) -LogFile $logFile
        }
        Write-Log -Message "----- Ende Test $t -----`n" -LogFile $logFile
    }

    Write-Host "Angriffsszenario $scenarioName abgeschlossen." -ForegroundColor Magenta
    Write-Log -Message "Angriffsszenario $scenarioName abgeschlossen.`n" -LogFile $logFile
}


function Select-And-RunScenario {
    $logDir = Join-Path $env:TEMP "AtomicTeam_Logs"
    if (-not (Test-Path $logDir)) {
        New-Item -ItemType Directory -Path $logDir | Out-Null
    }
    Write-Host "`nBitte wähle ein Szenario zum Ausführen:" -ForegroundColor Yellow
    Write-Host "1) Windows Client Szenario 1 (ca. 16 Techniques)"
    Write-Host "2) Windows Client Szenario 2 (ca. 15 Techniques)"
    Write-Host "3) Windows Server Szenario 1 (ca. 18 Techniques)"
    Write-Host "4) Windows Server Szenario 2 (ca. 20 Techniques)"
    Write-Host "Q) Beenden"
    $selection = Read-Host "Deine Auswahl"

    switch ($selection.ToUpper()) {
        "1" {
            $logFile = Join-Path $logDir ("Client_Szenario1_" + (Get-Date -Format "yyyyMMdd_HHmmss") + ".log")
            Run-Scenario -ScenarioName "Windows Client Szenario 1" -Tests @(
                "T1059.001", "T1547.001", "T1003.001", "T1083", "T1055.001", "T1133", "T1071.001",
                "T1112", "T1486", "T120", "T1566", "T1021.001", "T1114.001", "T1082", "T1485", "T1564.001"
            ) -LogFile $logFile
            return $true
        }
        "2" {
            $logFile = Join-Path $logDir ("Client_Szenario2_" + (Get-Date -Format "yyyyMMdd_HHmmss") + ".log")
            Run-Scenario -ScenarioName "Windows Client Szenario 2" -Tests @(
                "T1083", "T1112", "T1566", "T1560", "T1114.001", "T1543", "T1055.001",
                "T1065", "T1110", "T1189", "T1055.002", "T1562", "T1086", "T1082", "T1057"
            ) -LogFile $logFile
            return $true
        }
        "3" {
            $logFile = Join-Path $logDir ("Server_Szenario1_" + (Get-Date -Format "yyyyMMdd_HHmmss") + ".log")
            Run-Scenario -ScenarioName "Windows Server Szenario 1" -Tests @(
                "T1083", "T1098", "T1082", "T1116", "T1059.001", "T1114.002", "T1543", "T1105",
                "T1620", "T1021.001", "T1176", "T1564", "T1166", "T1486", "T1529", "T1057"
            ) -LogFile $logFile
            return $true
        }
        "4" {
            $logFile = Join-Path $logDir ("Server_Szenario2_" + (Get-Date -Format "yyyyMMdd_HHmmss") + ".log")
            Run-Scenario -ScenarioName "Windows Server Szenario 2" -Tests @(
                "T1566", "T1547.001", "T1560", "T1564", "T1112", "T1647", "T1059", "T1486",
                "T1528", "T1190", "T105", "T120", "T1114", "T1539", "T1301"
            ) -LogFile $logFile
            return $true
        }
        "Q" {
            Write-Host "Beende Programm." -ForegroundColor Red
            return $false
        }
        default {
            Write-Warning "Ungültige Eingabe. Bitte erneut versuchen."
            return $true
        }
    }
}

# Start des Hauptprogramms
Clear-Host
Write-Host "=== AtomicTeam Installer & Szenario Runner mit Defender-Ausnahme und Log ===" -ForegroundColor Cyan

Add-DefenderExclusion
Set-ExecutionPolicyIfNeeded
Install-AtomicRedTeamWithAtomics

while ($true) {
    $continue = Select-And-RunScenario
    if (-not $continue) { break }
}

Write-Host "Alle gewählten Szenarien wurden ausgeführt. Script beendet." -ForegroundColor Green
