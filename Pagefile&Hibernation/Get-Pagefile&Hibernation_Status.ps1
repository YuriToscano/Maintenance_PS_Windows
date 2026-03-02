# Get-Pagefile&Hibernation_Status
$hibernation = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Power" -Name "HibernateEnabled" -ErrorAction SilentlyContinue).HibernateEnabled

# Pagefile
$pagefiles = Get-CimInstance -ClassName Win32_PageFileUsage
$pagefileAuto = (Get-CimInstance -ClassName Win32_ComputerSystem).AutomaticManagedPagefile

# Monta o conteúdo do log
$lines = @()
$lines += "=== STATUS DO SISTEMA ==="
$lines += "Data/Hora: $(Get-Date -Format 'dd/MM/yyyy HH:mm:ss')"
$lines += "Computador: $env:COMPUTERNAME"

$lines += "`n[Hibernação]"
if ($hibernation -eq 1) {
    $lines += "  Status: ATIVADA"
} else {
    $lines += "  Status: DESATIVADA"
}

$lines += "`n[Pagefile]"
if ($pagefiles) {
    $lines += "  Status: ATIVADO"
    $lines += "  Gerenciado automaticamente: $pagefileAuto"
    foreach ($pf in $pagefiles) {
        $lines += "  Arquivo : $($pf.Name)"
        $lines += "  Tamanho : $($pf.AllocatedBaseSize) MB"
        $lines += "  Em uso  : $($pf.CurrentUsage) MB"
        $lines += "  Pico    : $($pf.PeakUsage) MB"
    }
} else {
    $lines += "  Status: DESATIVADO"
}

# Exibe no console
$lines | ForEach-Object { Write-Host $_ }

# Salva o log
$date = Get-Date -Format "yyyy-MM-dd_HH-mm"
$logPath = "C:\temp\Get-Pagefile&Hibernation_Status_$date.log"

if (-not (Test-Path "C:\temp")) {
    New-Item -ItemType Directory -Path "C:\temp" | Out-Null
}

$lines | Out-File -FilePath $logPath -Encoding UTF8

Write-Host "`nLog salvo em: $logPath" -ForegroundColor Cyan
