# Atomic-Red-Team-Test-Framework-PS-Wrapper
simple wrapper for atomic tests on windows clients and servers. Contains 2 scenarios for each

Execution logs can be found in ` %TEMP%\AtomicTeam_Logs`
***

## Windows Client Szenario 1 (ca. 16 Techniques)  
Dieses Szenario simuliert einen typischen Angriff auf einen Windows-Arbeitsplatz, bei dem PowerShell-basierte Befehlsausführung mit Persistenz, Credential Dumping und Datenverschlüsselung kombiniert werden.

- **T1059.001 - PowerShell:** Ermöglicht Skriptausführung und manuelle Interaktion zur Ausführung von schädlichem Code auf dem System.  
- **T1547.001 - Registry Run Keys / Startup Folder:** Persistenz über Systemstart, indem Schadcode beim Booten automatisch gestartet wird.  
- **T1003.001 - LSASS Memory:** Extrahieren von Anmeldedaten aus dem Speicherprozess LSASS zur Ausweitung von Zugriffsrechten.  
- **T1083 - File and Directory Discovery:** Sichten von Verzeichnissen und Dateien, um wertvolle Informationen oder Angriffsziele zu identifizieren.  
- **T1055.001 - DLL Injection:** Einfügen von Schadcode in laufende Prozesse zur Tarnung und Umgehung von Sicherheitsmaßnahmen.  
- **T1133 - External Remote Services:** Nutzung externer(Remote) Dienste zur Kommunikation mit Command-Center.  
- **T1071.001 - Web Protocols:** Kommunikation über HTTP/HTTPS mit Command-and-Control Servern, typischer Kanal für Daten- und Befehlsaustausch.  
- **T1112 - Modify Registry:** Anpassung von Registrierungseinträgen zur Manipulation der Systemkonfiguration oder Persistenz.  
- **T1486 - Data Encrypted for Impact:** Verschlüsselung von Dateien auf dem System zum Zweck der Erpressung (Ransomware).  
- **T1566 - Phishing:** Einsatz sozialer Manipulation zur initialen Kompromittierung des Systems über Benutzerinteraktion.  
- **T1021.001 - Remote Desktop Protocol:** Fernzugriff über RDP, um lateral Movement zu ermöglichen.  
- **T1114.001 - Email Collection:** Sammeln von E-Mails als Quelle sensibler Informationen.  
- **T1082 - System Information Discovery:** Sammlung systemischer Infos wie Betriebssystemversion oder Netzwerkdetails.  
- **T1485 - Data Destruction:** Löschen von Daten, um Spuren zu verwischen oder Schaden anzurichten.  
- **T1564.001 - Hidden Files and Directories:** Verbergen von Dateien und Ordnern, um Analyse und Entdeckung zu erschweren.  

***

## Windows Client Szenario 2 (ca. 15 Techniques)  
Fokus auf Dateierkennung, Verteidigungsumgehung, Brute Force und weitere Formen der Benutzererkennung und Datenmanipulation.

- **T1083 - File and Directory Discovery:** Auffinden von wichtigen Dateien und Ordnern auf dem Client.  
- **T1112 - Modify Registry:** Manipulation der Registry für Persistenz oder Konfigurationsänderungen.  
- **T1566 - Phishing:** Soziale Angriffe zur Erlangung initialen Zugriffs auf das System.  
- **T1560 - Archive Collected Data:** Komprimieren gesammelter Daten vor der Exfiltration.  
- **T1114.001 - Email Collection:** Sammeln von E-Mails.  
- **T1543 - Windows Service:** Erstellen oder Modifizieren von Windows Services zur Aufrechterhaltung bösartiger Aktivitäten.  
- **T1055.001 - DLL Injection:** Einschleusen von Code in andere Prozesse.  
- **T1065 - Indicator Removal on Host:** Löschen von Spuren und Logs.  
- **T1110 - Brute Force:** Systematisches Erraten von Passwörtern.  
- **T1189 - Drive-by Compromise:** Infektion über kompromittierte Webseiten.  
- **T1055.002 - Process Hollowing:** Übernahme eines legitimen Prozesses durch Schadcode.  
- **T1562 - Impair Defenses:** Abschalten von Schutzmechanismen.  
- **T1086 - PowerShell:** Nutzung von PowerShell für Angriffsoperationen.  
- **T1057 - Process Discovery:** Ermitteln aktiver Prozesse.  
- **T1082 - System Information Discovery:** Sichtung von Systeminformationen.  

***

## Windows Server Szenario 1 (ca. 18 Techniques)  
Ein Szenario, das Server-spezifische Reconnaissance, lateral Movement, Persistence und Sabotage simuliert.

- **T1083 - File and Directory Discovery:** Finden wichtiger Dateien und Konfigurationspfade.  
- **T1098 - Account Manipulation:** Ändern von Benutzerkonten für böswilligen Zugriff.  
- **T1082 - System Information Discovery:** Sammeln von Server-spezifischen Konfigurationsdaten.  
- **T1116 - NT Service Enumeration:** Auflisten und Analyse der laufenden Dienste.  
- **T1059.001 - PowerShell:** Skriptgesteuerte Aktionen und Automatisierungen für Angriffe.  
- **T1114.002 - Screen Capture:** Erfassung von Bildschirminhalten zur Informationsgewinnung.  
- **T1543 - Windows Service:** Erstellen und Manipulieren von Diensten zur Persistenz.  
- **T1105 - Ingress Tool Transfer:** Laden externer Tools auf den Server, um Angriffsfähigkeiten zu erweitern.  
- **T1620 - Reflective Code Loading:** Laden von Code direkt im Speicher ohne Disk-Spuren.  
- **T1021.001 - Remote Desktop Protocol:** Fernzugriff auf Systeme, um sich weiter zu verbreiten.  
- **T1176 - Browser Extensions:** Missbrauch von Browsererweiterungen für Persistenz/Zugang.  
- **T1564 - Hidden Files and Directories:** Verstecken von bösartigen Artefakten.  
- **T1166 - Masquerading:** Tarnen von Dateien und Prozessen als legitim.  
- **T1486 - Data Encrypted for Impact:** Erpressung durch Datenverschlüsselung.  
- **T1529 - System Shutdown/Reboot:** Systemabsturz oder Neustart, um Sicherheitssysteme zu stören.  
- **T1057 - Process Discovery:** Auffinden laufender Prozesse für weitere Aktionen.  
- **T1166 - Masquerading:** Täuschung durch Namensänderung bösartiger Komponenten.  
- **T1486 - Data Encrypted for Impact** (nochmals zur Betonung, weil extrem relevant).

***

## Windows Server Szenario 2 (ca. 20 Techniques)  
Ein breit angelegtes Angriffsszenario zur detaillierten Kompromittierung von Server-Ökosystemen inklusive Netzwerkangriffen und Datenexfiltration.

- **T1566 - Phishing:** Initialer Zugang über Social Engineering.  
- **T1547.001 - Registry Run Keys / Startup Folder:** Persistenz über Autostart.  
- **T1560 - Archive Collected Data:** Datenvorbereitung für Exfiltration.  
- **T1564 - Hidden Files and Directories:** Verstecken von bösartigem Code und Werkzeugen.  
- **T1112 - Modify Registry:** Konfigurationsmanipulation.  
- **T1647 - Boot or Logon Autostart Execution:** Systemweite Persistenz durch Autostart.  
- **T1059 - Command and Scripting Interpreter:** Breite Nutzung von Skriptsprachen.  
- **T1486 - Data Encrypted for Impact:** Ransomware-artige Aktionen zur Datenverschlüsselung.  
- **T1528 - Steal Application Access Token:** Zugriffserweiterung mit Zugangstokens.  
- **T1190 - Exploit Public-Facing Application:** Schwachstellenausnutzung gegen öffentliche Dienste.  
- **T105 - (Bitte verifizieren, evtl. Tippfehler)**  
- **T120 - (Bitte verifizieren, evtl. Tippfehler)**  
- **T1114 - Email Collection:** Sammeln von E-Mails.  
- **T1539 - Steal Web Session Cookie:** Zugriff auf Web-Sessiondaten.  
- **T1301 - Accessibility Features:** Nutzung von Bedienungshilfen zur Eskalation.  
- **T1176 - Browser Extensions:** Ausnutzung von Browsererweiterungen.  
- **T1105 - Ingress Tool Transfer:** Übertragen von Tools auf Server.  
- **T1113 - Screen Capture:** Bildschirmfotos zur Aufklärung.  
- **T1135 - Network Share Discovery:** Identifikation freigegebener Netzwerkressourcen.  
- **T1543 - Windows Service:** Manipulation von Diensten für Persistenz und Kontrolle.  

***
