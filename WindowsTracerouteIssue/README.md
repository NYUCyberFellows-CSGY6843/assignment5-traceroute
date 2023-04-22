# traceroute.ps1 Powershell Script Instructions:
### *For Windows 10 and 11 users experiencing “timeouts” for all intermediary routers* 
1. Navigate to your Windows search bar and type “powershell” 
2. Right Click “Windows Powershell” and left click on “Run as administrator” 
3. Assuming you downloaded traceroute.ps1 into your “Downloads” directory use the following command: 
`cd C:\Users\YOURUSERNAME\Downloads`
4. Finally use the next command to execute the script:
`./traceroute.ps1`
5. This should create the required firewall rules to allow your python traceroute program to receive all the ICMP packets required for the lab.
6. Once you are finished with the lab run undo_traceroute.ps1 to remove the firewall rules required for the lab.
`./undo_traceroute.ps1`
