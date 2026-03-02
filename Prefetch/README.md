# Guia de Uso – Scripts PowerShell para Prefetch

## 📌 Objetivo
Este guia apresenta dois scripts em PowerShell:
1. **Get-PrefetchStatus.ps1** – Verifica o status do Prefetch (registro, serviço, tarefas agendadas e pasta).
2. **Disable-Prefetch.ps1** – Desabilita o Prefetch, apaga os arquivos da pasta e registra as ações realizadas.

Ambos os scripts geram **logs automáticos** em `C:\Temp` com data e hora no nome do arquivo.

---

## ⚙️ Funcionalidades

### Script de Verificação (Get-PrefetchStatus.ps1)
- Lê o valor do registro `EnablePrefetcher`.
- Verifica o status do serviço **SysMain (Superfetch)**.
- Procura tarefas agendadas relacionadas ao Prefetch.
- Conta os arquivos existentes na pasta `C:\Windows\Prefetch`.
- Gera log em `C:\Temp\PrefetchStatus_YYYYMMDD_HHMMSS.log`.

### Script de Desabilitação (Disable-Prefetch.ps1)
- Define `EnablePrefetcher = 0` no registro (desabilitado).
- Para e desabilita o serviço **SysMain**.
- Desabilita tarefas agendadas relacionadas ao Prefetch.
- Remove todos os arquivos da pasta `C:\Windows\Prefetch`.
- Gera log em `C:\Temp\PrefetchDisable_YYYYMMDD_HHMMSS.log`.

---

## 🚀 Ganhos Esperados

### Em HDs (discos mecânicos)
- **Redução de escrita desnecessária**: Prefetch gera arquivos constantemente, o que aumenta o desgaste físico em discos mecânicos.
- **Menor fragmentação**: menos arquivos temporários criados e apagados.
- **Economia de espaço**: a pasta Prefetch pode acumular centenas de arquivos.

### Em SSDs
- **Maior vida útil**: SSDs têm ciclos limitados de escrita; desabilitar Prefetch reduz gravações desnecessárias.
- **Desempenho neutro ou positivo**: SSDs já possuem acesso rápido, tornando o Prefetch pouco relevante.

### Em Privacidade
- **Menos rastros de uso**: os arquivos da pasta Prefetch registram quais programas foram executados e quando.
- **Maior controle**: ao apagar e desabilitar, você evita que o sistema mantenha histórico de execução de aplicativos.

---

## 📂 Estrutura de Logs
Os logs são salvos em `C:\Temp` com nomes no formato:

- `PrefetchStatus_YYYYMMDD_HHMMSS.log` → Verificação
- `PrefetchDisable_YYYYMMDD_HHMMSS.log` → Desabilitação

Exemplo:  
`PrefetchStatus_20260302_1130.log`

---

## ▶️ Como Usar

1. Salve os scripts em arquivos `.ps1` (ex.: `Get-PrefetchStatus.ps1` e `Disable-Prefetch.ps1`).
2. Abra o **PowerShell como Administrador**.
3. Execute:
   ```powershell
   .\Get-PrefetchStatus.ps1
