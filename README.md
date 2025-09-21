# Atomic-Red-Team-Test-Framework-PS-Wrapper
simple wrapper for atomic tests on windows clients and servers. Contains 2 scenarios for each

Execution logs can be found in ` %TEMP%\AtomicTeam_Logs`
***



### Windows Client Szenario 1

| ID        | Technique (Kurzname)                                   | UKC-Phase            |
| --------- | ------------------------------------------------------ | -------------------- |
| T1059.001 | Command & Scripting Interpreter: PowerShell            | Execution            |
| T1547.001 | Boot/Logon Autostart: Registry Run Keys/Startup Folder | Persistence          |
| T1003.001 | OS Credential Dumping: LSASS Memory                    | Credential Access    |
| T1083     | File and Directory Discovery                           | Discovery            |
| T1055.001 | Process Injection: DLL Injection                       | Defense Evasion      |
| T1133     | External Remote Services                               | Initial Foothold     |
| T1071.001 | App Layer Protocol: Web Protocols (HTTP/S)             | Command & Control    |
| T1112     | Modify Registry                                        | Defense Evasion      |
| T1486     | Data Encrypted for Impact                              | Impact               |
| T120$      |  User ExecutioN                                       | Delivery / Execution |
| T1566     | Phishing                                               | Delivery             |
| T1021.001 | Remote Services: RDP                                   | Lateral Movement     |
| T1114.001 | Email Collection: Local Email                          | Collection           |
| T1082     | System Information Discovery                           | Discovery            |
| T1485     | Data Destruction                                       | Impact               |
| T1564.001 | Hide Artifacts: Hidden Files/Dirs                      | Defense Evasion      |


---

### Windows Server Szenario 1

| ID        | Technique (Kurzname)                      | UKC-Phase            |
| --------- | ----------------------------------------- | -------------------- |
| T1083     | File/Directory Discovery                  | Discovery            |
| T1098     | Account Manipulation                      | Persistence          |
| T1082     | System Information Discovery              | Discovery            |
| T1116     | (Alt-ID → T1553.002 Code Signing)         | Defense Evasion      |
| T1059.001 | PowerShell Execution                      | Execution            |
| T1114.002 | Email Collection: Remote Email            | Collection           |
| T1543     | Create/Modify System Process (Service)    | Persistence          |
| T1105     | Ingress Tool Transfer                     | Command & Control    |
| T1620     | Reflective Code Loading                   | Defense Evasion      |
| T1021.001 | Remote Services: RDP                      | Lateral Movement     |
| T1176     | Browser/Software Extensions               | Persistence          |
| T1564     | Hide Artifacts (Parent)                   | Defense Evasion      |
| T1166     | (Alt-ID → T1548.001 Privilege Escalation) | Privilege Escalation |
| T1486     | Data Encrypted for Impact                 | Impact               |
| T1529     | System Shutdown/Reboot                    | Impact               |
| T1057     | Process Discovery                         | Discovery            |

