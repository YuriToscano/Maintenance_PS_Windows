# Get-Pagefile&Hibernation_Disable
# Este script desativa hibernação e pagefile, e gera um log

# Desativa hibernação
Write-Host "Desativando hibernação..."
powercfg -h off

# Desativa pagefile
Write-Host "Desativando pagefile..."
# Remove configuração automática
Set-CimInstance -ClassName Win32_ComputerSystem -Property @{AutomaticManagedPagefile=$false}
# Remove todos os arquivos de paginação
$pagefiles = Get-CimInstance -ClassName Win32_PageFileSetting
foreach ($pf in $pagefiles) {
    Remove-CimInstance -InputObject $pf
}

# Monta o conteúdo do log
$lines = @()
$lines += "=== AÇÕES REALIZADAS ==="
$lines += "Data/Hora: $(Get-Date -Format 'dd/MM/yyyy HH:mm:ss')"
$lines += "Computador: $env:COMPUTERNAME"
$lines += "`n[Hibernação]"
$lines += "  Status: DESATIVADA (powercfg -h off)"
$lines += "`n[Pagefile]"
$lines += "  Status: DESATIVADO (AutomaticManagedPagefile = False, arquivos removidos)"

# Exibe no console
$lines | ForEach-Object { Write-Host $_ }

# Salva o log
$date = Get-Date -Format "yyyy-MM-dd_HH-mm"
$logPath = "C:\temp\Get-Pagefile&Hibernation_Disable_$date.log"

if (-not (Test-Path "C:\temp")) {
    New-Item -ItemType Directory -Path "C:\temp" | Out-Null
}

$lines | Out-File -FilePath $logPath -Encoding UTF8

Write-Host "`nLog salvo em: $logPath" -ForegroundColor Cyan
