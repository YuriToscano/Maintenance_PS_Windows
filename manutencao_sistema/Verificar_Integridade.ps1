$logPath = "C:\Temp\VerificarIntegridade-$((Get-Date).ToString('yyyyMMdd-HHmmss')).log"
sfc /scannow | Out-File -FilePath $logPath -Append
DISM /Online /Cleanup-Image /RestoreHealth | Out-File -FilePath $logPath -Append
Write-Output "Verificação concluída. Log salvo em $logPath"