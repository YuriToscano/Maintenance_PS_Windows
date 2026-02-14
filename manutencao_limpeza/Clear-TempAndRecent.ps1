# Script: Clear-TempAndRecent.ps1
# Executar sempre como Administrador

$systemPaths = @(
    "C:\Windows\Prefetch",
    "C:\Windows\Temp"
)

$userPaths = @(
    "AppData\Local\Temp",
    "AppData\Roaming\Microsoft\Windows\Recent"
)

# Criar pasta de log se não existir
$logDir = "C:\Temp"
if (!(Test-Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir | Out-Null
}

# Nome do arquivo de log com data/hora
$timestamp = (Get-Date).ToString("yyyyMMdd-HHmmss")
$logFile = Join-Path $logDir "CleanupLog-$timestamp.txt"

# Função para registrar no log e mostrar no console
function Write-Log {
    param([string]$Message, [string]$Color = "White")
    $time = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    $line = "$time - $Message"
    Add-Content -Path $logFile -Value $line
    Write-Host $line -ForegroundColor $Color
}

Write-Log "=== Início da limpeza ===" "Cyan"

# Limpar pastas do sistema
foreach ($path in $systemPaths) {
    if (Test-Path $path) {
        Get-ChildItem -Path $path -Recurse -Force -ErrorAction SilentlyContinue | ForEach-Object {
            try {
                Remove-Item $_.FullName -Force -Recurse -ErrorAction Stop
                Write-Log "Apagado: $($_.FullName)" "Green"
            } catch {
                Write-Log "Falha ao apagar: $($_.FullName) - $($_.Exception.Message)" "Red"
            }
        }
    }
}

# Limpar pastas de todos os usuários
$usersFolder = "C:\Users"
Get-ChildItem $usersFolder -Directory | ForEach-Object {
    $user = $_.FullName
    foreach ($relPath in $userPaths) {
        $target = Join-Path $user $relPath
        if (Test-Path $target) {
            Get-ChildItem -Path $target -Recurse -Force -ErrorAction SilentlyContinue | ForEach-Object {
                try {
                    Remove-Item $_.FullName -Force -Recurse -ErrorAction Stop
                    Write-Log "Apagado: $($_.FullName)" "Green"
                } catch {
                    Write-Log "Falha ao apagar: $($_.FullName) - $($_.Exception.Message)" "Red"
                }
            }
        }
    }
}

# Esvaziar a Lixeira
try {
    (New-Object -ComObject Shell.Application).NameSpace(10).Items() | ForEach-Object {
        try {
            Remove-Item $_.Path -Force -Recurse -ErrorAction Stop
            Write-Log "Lixeira apagado: $($_.Path)" "Green"
        } catch {
            Write-Log "Falha ao apagar da Lixeira: $($_.Path) - $($_.Exception.Message)" "Red"
        }
    }
    Write-Log "Lixeira esvaziada com sucesso" "Yellow"
} catch {
    Write-Log "Falha ao esvaziar a Lixeira - $($_.Exception.Message)" "Red"
}

Write-Log "=== Fim da limpeza ===" "Cyan"
