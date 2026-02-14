$logPath = "C:\Temp\LimparDNS-$((Get-Date).ToString('yyyyMMdd-HHmmss')).log"
ipconfig /flushdns | Out-File -FilePath $logPath -Append
Write-Output "Cache DNS limpo. Log salvo em $logPath"