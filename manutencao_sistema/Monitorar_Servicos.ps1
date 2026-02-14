$logPath = "C:\Temp\MonitorarServicos-$((Get-Date).ToString('yyyyMMdd-HHmmss')).log"
Get-Service | Where-Object {$_.Status -eq "Stopped"} | Out-File -FilePath $logPath -Append
Write-Output "Serviços monitorados. Log salvo em $logPath"