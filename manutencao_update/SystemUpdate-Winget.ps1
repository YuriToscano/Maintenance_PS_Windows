# Criar pasta de logs se não existir
$logPath = "C:\Temp"
if (!(Test-Path $logPath)) {
    New-Item -ItemType Directory -Path $logPath | Out-Null
}

# Timestamp para o arquivo
$timestamp = Get-Date -Format "yyyyMMdd-HHmm"
$logFile = "$logPath\winget-upgrade-$timestamp.log"

# Feedback visual inicial
Write-Host "======================================" -ForegroundColor Cyan
Write-Host " Iniciando atualização com Winget " -ForegroundColor Cyan
Write-Host " Logs serão salvos em: $logFile " -ForegroundColor Yellow
Write-Host "======================================" -ForegroundColor Cyan

# Listar programas instalados
"=== LISTA DE PROGRAMAS INSTALADOS ===" | Out-File $logFile -Encoding utf8
winget list | Out-File $logFile -Encoding utf8 -Append

# Atualizar todos os programas e filtrar saída
"=== INÍCIO DAS ATUALIZAÇÕES ===" | Out-File $logFile -Encoding utf8 -Append
$updateOutput = winget upgrade --all --verbose-logs |
    Where-Object { $_ -notmatch "KB /" -and $_ -notmatch "MB /" -and $_ -notmatch "Ô" }

$updateOutput | Out-File $logFile -Encoding utf8 -Append

# Detectar se houve indicação de reboot
if ($updateOutput -match "restart required" -or $updateOutput -match "reboot") {
    Write-Host "⚠️  Algum pacote solicitou REBOOT!" -ForegroundColor Red
    "=== ATENÇÃO: Algum pacote solicitou REBOOT ===" | Out-File $logFile -Encoding utf8 -Append
} else {
    Write-Host "✅ Nenhum pacote solicitou reboot." -ForegroundColor Green
    "=== Nenhum pacote solicitou reboot ===" | Out-File $logFile -Encoding utf8 -Append
}

# Feedback visual final
Write-Host "======================================" -ForegroundColor Cyan
Write-Host " Atualização concluída em $(Get-Date) " -ForegroundColor Green
Write-Host " Log salvo em: $logFile " -ForegroundColor Yellow
Write-Host "======================================" -ForegroundColor Cyan

"=== FIM DO PROCESSO EM $(Get-Date) ===" | Out-File $logFile -Encoding utf8 -Append
