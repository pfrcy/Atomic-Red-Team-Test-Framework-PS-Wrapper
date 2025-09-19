# Pfad zum Invoke-AtomicRedTeam Modul anpassen
$atomicModulePath = "C:\AtomicRedTeam\invoke-atomicredteam-xxxx\Invoke-AtomicRedTeam.psd1"

Import-Module -Name $atomicModulePath -Force -ErrorAction Stop

# Szenario 1 Cleanup Tests
$scenario1_tests = @(
    "T1059.001", "T1547.001", "T1003.001", "T1083", "T1055.001", "T1133", "T1071.001",
    "T1112", "T1486", "T1566", "T1021.001", "T1114.001", "T1082", "T1485", "T1564.001"
)

# Szenario 2 Cleanup Tests
$scenario2_tests = @(
    "T1083", "T1112", "T1566", "T1560", "T1114.001", "T1543", "T1055.001",
    "T1065", "T1110", "T1189", "T1055.002", "T1562", "T1086", "T1082", "T1057"
)

function Cleanup-Scenario {
    param (
        [string]$scenarioName,
        [string[]]$tests
    )
    Write-Host "Starte Cleanup für Szenario $scenarioName..." -ForegroundColor Yellow
    foreach ($test in $tests) {
        try {
            Write-Host "Cleanup Test $test" -ForegroundColor Cyan
            Invoke-AtomicTest -AtomicTechnique $test -Cleanup -ErrorAction Stop
            Write-Host "Cleanup abgeschlossen für $test" -ForegroundColor Green
        }
        catch {
            Write-Warning "Cleanup fehlgeschlagen für $test: $_"
        }
    }
    Write-Host "Cleanup für Szenario $scenarioName abgeschlossen." -ForegroundColor Magenta
}

# Cleanup ausführen
Cleanup-Scenario -scenarioName "1" -tests $scenario1_tests
Cleanup-Scenario -scenarioName "2" -tests $scenario2_tests
