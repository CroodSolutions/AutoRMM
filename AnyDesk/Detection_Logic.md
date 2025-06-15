Initial detection logic; look for the following via EDR (block or alert):

 EXE:
 - AnyDesk.exe
File Indicators:
 - %APPDATA%\AnyDesk
 - C:\Program Files (x86)\AnyDesk\
 - C:\Program Files\AnyDesk\
 - C:\Users\<User>\AppData\Roaming\AnyDesk\
 - C:\Users\<Username>\Pictures\AnyDesk\  (if screen captures have been taken)
Network Indicators:
 - *.net.anydesk.com
 - Ports 80,443, 6568 (can be any of these)
 - Look for lateral movement alerts via IDS/NDR signatures to detect this, since it can be local. 

Important to Remember: AnyDesk can be cloud or locally hosted, so keep this in mind when searching for lateral movement. An attacker could compromise a single host, install an AnyDesk server, and then install agents to communicate back to the internal server. If the target is already an AnyDesk shop, it is also at least in-theory possible that they could attempt to modify the config files in each host to point specific or even all AnyDesk hosts to the attacker controlled server. We have not tested this yet, but it seems like it could be possible.  

Note: This is preliminary - I encourage others to contribute and improve this first quick pass at detection logic for AnyDesk.

See Lol RMM for better detection logic on this one: https://lolrmm.io/tools/anydesk
