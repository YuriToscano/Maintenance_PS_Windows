# Script: Clear-TempAndRecent.ps1
# Executar sempre como Administrador

# Caminhos fixos do sistema
$systemPaths = @(
    "C:\Windows\Prefetch",
    "C:\Windows\Temp"
)

# Pastas específicas por usuário
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

# Função para registrar no log
function Write-Log {
    param([string]$Message)
    $time = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    Add-Content -Path $logFile -Value "$time - $Message"
}

Write-Log "=== Início da limpeza ==="

# Limpar pastas do sistema
foreach ($path in $systemPaths) {
    if (Test-Path $path) {
        Get-ChildItem -Path $path -Recurse -Force -ErrorAction SilentlyContinue | ForEach-Object {
            try {
                Remove-Item $_.FullName -Force -Recurse -ErrorAction Stop
                Write-Log "Apagado: $($_.FullName)"
            } catch {
                Write-Log "Falha ao apagar: $($_.FullName) - $($_.Exception.Message)"
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
                    Write-Log "Apagado: $($_.FullName)"
                } catch {
                    Write-Log "Falha ao apagar: $($_.FullName) - $($_.Exception.Message)"
                }
            }
        }
    }
}

# Esvaziar a Lixeira
try {
    # Remove todos os itens da Lixeira
    (New-Object -ComObject Shell.Application).NameSpace(10).Items() | ForEach-Object {
        try {
            Remove-Item $_.Path -Force -Recurse -ErrorAction Stop
            Write-Log "Lixeira apagado: $($_.Path)"
        } catch {
            Write-Log "Falha ao apagar da Lixeira: $($_.Path) - $($_.Exception.Message)"
        }
    }
    Write-Log "Lixeira esvaziada com sucesso"
} catch {
    Write-Log "Falha ao esvaziar a Lixeira - $($_.Exception.Message)"
}

Write-Log "=== Fim da limpeza ==="
