$logPath = "C:\Temp\TestarConectividade-$((Get-Date).ToString('yyyyMMdd-HHmmss')).log"
Test-Connection -ComputerName "8.8.8.8" -Count 4 | Out-File -FilePath $logPath -Append
Write-Output "Teste de conectividade concluído. Log salvo em $logPath"