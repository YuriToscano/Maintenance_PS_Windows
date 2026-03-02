# Caminho do log com data/hora no nome
$logPath = "C:\Temp\PrefetchStatus_{0}.log" -f (Get-Date -Format "yyyyMMdd_HHmmss")

# Função para escrever no log
function Write-Log($msg) {
    $msg | Tee-Object -FilePath $logPath -Append
}

Write-Log "===== Verificação Prefetch ====="
Write-Log "Data/Hora: $(Get-Date)"

# Registro
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters"
$regValue = Get-ItemProperty -Path $regPath -Name EnablePrefetcher -ErrorAction SilentlyContinue
Write-Log "Registro EnablePrefetcher: $($regValue.EnablePrefetcher)"

# Serviço Superfetch (SysMain)
$svc = Get-Service -Name SysMain -ErrorAction SilentlyContinue
if ($svc) {
    Write-Log "Serviço SysMain: $($svc.Status)"
} else {
    Write-Log "Serviço SysMain não encontrado."
}

# Tarefa Agendada relacionada
$task = Get-ScheduledTask | Where-Object {$_.TaskName -like "*Prefetch*"}
if ($task) {
    Write-Log "Tarefas agendadas encontradas: $($task.TaskName)"
} else {
    Write-Log "Nenhuma tarefa agendada relacionada ao Prefetch encontrada."
}

# Pasta Prefetch
$prefetchPath = "C:\Windows\Prefetch"
if (Test-Path $prefetchPath) {
    $files = Get-ChildItem $prefetchPath | Measure-Object
    Write-Log "Arquivos na pasta Prefetch: $($files.Count)"
} else {
    Write-Log "Pasta Prefetch não encontrada."
}

Write-Log "===== Fim da Verificação ====="
