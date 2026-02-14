$logPath = "C:\Temp\ChecarDefender-$((Get-Date).ToString('yyyyMMdd-HHmmss')).log"
Get-MpComputerStatus | Out-File -FilePath $logPath -Append
Write-Output "Status do Windows Defender verificado. Log salvo em $logPath"