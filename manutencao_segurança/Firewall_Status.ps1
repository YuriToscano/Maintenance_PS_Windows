$logPath = "C:\Temp\FirewallStatus-$((Get-Date).ToString('yyyyMMdd-HHmmss')).log"
netsh advfirewall show allprofiles | Out-File -FilePath $logPath -Append
Write-Output "Status do firewall verificado. Log salvo em $logPath"