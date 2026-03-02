# Caminho do log com data/hora no nome
$logPath = "C:\Temp\PrefetchDisable_{0}.log" -f (Get-Date -Format "yyyyMMdd_HHmmss")

function Write-Log($msg) {
    $msg | Tee-Object -FilePath $logPath -Append
}

Write-Log "===== Desabilitando Prefetch ====="
Write-Log "Data/Hora: $(Get-Date)"

# Desabilitar no Registro
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters"
Set-ItemProperty -Path $regPath -Name EnablePrefetcher -Value 0 -Force
Write-Log "Registro EnablePrefetcher definido como 0 (desabilitado)."

# Parar e desabilitar serviço SysMain
$svc = Get-Service -Name SysMain -ErrorAction SilentlyContinue
if ($svc) {
    Stop-Service SysMain -Force
    Set-Service SysMain -StartupType Disabled
    Write-Log "Serviço SysMain parado e desabilitado."
} else {
    Write-Log "Serviço SysMain não encontrado."
}

# Desabilitar tarefas agendadas relacionadas
$tasks = Get-ScheduledTask | Where-Object {$_.TaskName -like "*Prefetch*"}
foreach ($t in $tasks) {
    Disable-ScheduledTask -TaskName $t.TaskName -TaskPath $t.TaskPath
    Write-Log "Tarefa $($t.TaskName) desabilitada."
}
if (-not $tasks) {
    Write-Log "Nenhuma tarefa agendada relacionada ao Prefetch encontrada."
}

# Apagar arquivos da pasta Prefetch
$prefetchPath = "C:\Windows\Prefetch"
if (Test-Path $prefetchPath) {
    Get-ChildItem $prefetchPath -Force | Remove-Item -Force
    Write-Log "Arquivos da pasta Prefetch apagados."
} else {
    Write-Log "Pasta Prefetch não encontrada."
}

Write-Log "===== Fim da Desabilitação ====="
