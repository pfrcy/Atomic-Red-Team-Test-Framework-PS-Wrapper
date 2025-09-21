# Atomic-Red-Team-Test-Framework-PS-Wrapper
simple wrapper for atomic tests on windows clients and servers. Contains 2 scenarios for each

Execution logs can be found in ` %TEMP%\AtomicTeam_Logs`
***



### Windows Client Szenario 1
| ID         | Technik (Kurzname)                                          | UKC-Phase          |
|------------|-------------------------------------------------------------|--------------------|
| T1059.001  | Command & Scripting Interpreter: PowerShell                 | Execution          |
| T1083      | File & Directory Discovery                                  | Discovery          |
| T1082      | System Information Discovery                                | Discovery          |
| T1003.001  | OS Credential Dumping: LSASS Memory                         | Credential Access  |
| T1112      | Modify Registry                                             | Defense Evasion    |
| T1547.001  | Boot/Logon Autostart: Registry Run Keys / Startup           | Persistence        |
| T1055.001  | Process Injection: DLL Injection                            | Defense Evasion    |
| T1133      | External Remote Services                                    | Initial Foothold   |
| T1071.001  | App Layer Protocol: Web Protocols (HTTP/S)                  | Command & Control  |
| T1564.001  | Hide Artifacts: Hidden Files / ADS                          | Defense Evasion    |
| T1486      | Data Encrypted for Impact (optional, Lab-only)              | Impact             |
| T1485      | Data Destruction (optional, Lab-only)                       | Impact             |
| T1204      | User Execution (simuliert)                                  | Delivery / Execution|
| T1021.001  | Remote Services: RDP (Client-Seite Tests)                   | Lateral Movement   |
| T1114.001  | Email Collection: Local Email                               | Collection         |



---
### Windows Server Szenario 1
| ID         | Technik (Kurzname)                                          | UKC-Phase          |
|------------|-------------------------------------------------------------|--------------------|
| T1059.001  | Command & Scripting Interpreter: PowerShell                 | Execution          |
| T1057      | Process Discovery                                           | Discovery          |
| T1083      | File/Directory Discovery                                    | Discovery          |
| T1082      | System Information Discovery                                | Discovery          |
| T1098      | Account Manipulation                                        | Persistence        |
| T1543      | Create/Modify System Process (Service)                      | Persistence        |
| T1116      | (Alt-ID → T1553.002) Code Signing                          | Defense Evasion    |
| T1620      | Reflective Code Loading                                     | Defense Evasion    |
| T1105      | Ingress Tool Transfer                                       | Command & Control  |
| T1166      | (Alt-ID → T1548.001) Privilege Escalation (varianten)       | Privilege Escalation|
| T1021.001  | Remote Services: RDP                                        | Lateral Movement   |
| T1564      | Hide Artifacts (Parent)                                     | Defense Evasion    |
| T1486      | Data Encrypted for Impact (optional, Lab-only)              | Impact             |
| T1529      | System Shutdown / Reboot (optional, Lab-only)               | Impact             |

