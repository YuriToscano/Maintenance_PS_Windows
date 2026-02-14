$logPath = "C:\Temp\RenovarIP-$((Get-Date).ToString('yyyyMMdd-HHmmss')).log"
ipconfig /release | Out-File -FilePath $logPath -Append
ipconfig /renew | Out-File -FilePath $logPath -Append
Write-Output "IP renovado. Log salvo em $logPath"