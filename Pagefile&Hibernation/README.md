# 📘 Guia de Uso – Get-Pagefile&Hibernation_Disable

Este script em PowerShell tem como objetivo **desativar a hibernação e o arquivo de paginação (pagefile)** no Windows, registrando todas as ações em um log para auditoria.

## ⚙️ Funcionalidades

- **Desativação da Hibernação**
  - Executa `powercfg -h off` para desligar a hibernação.
  - Remove o arquivo `hiberfil.sys` do disco, liberando espaço.

- **Desativação do Pagefile**
  - Configura o sistema para não gerenciar automaticamente o arquivo de paginação.
  - Remove todos os arquivos de paginação existentes (`pagefile.sys`).

- **Registro em Log**
  - Cria um arquivo em `C:\temp` com o nome:
    ```
    Get-Pagefile&Hibernation_Disable_YYYY-MM-DD_HH-mm.log
    ```
  - Contém data/hora, nome do computador e status das ações realizadas.


## 📂 Exemplo de Saída do Log

=== AÇÕES REALIZADAS ===
Data/Hora: 02/03/2026 19:45:00
Computador: MEU-PC

[Hibernação]
Status: DESATIVADA (powercfg -h off)

[Pagefile]
Status: DESATIVADO (AutomaticManagedPagefile = False, arquivos removidos)

## 💾 Ganhos em Recursos

### 1. Espaço em Disco
- **Hibernação**: remove o arquivo `hiberfil.sys`, que geralmente ocupa **30% a 40% da RAM instalada**.  
  - Exemplo: em um PC com 16 GB de RAM, o arquivo pode ocupar até **6 GB no SSD/HD**.
- **Pagefile**: remove o arquivo `pagefile.sys`, que pode variar de **1 GB a 8 GB ou mais**, dependendo da configuração.

➡️ **Resultado prático**: mais espaço livre em disco, especialmente útil em SSDs menores.

### 2. Performance em SSD
- Menos escrita constante no `pagefile.sys` → reduz desgaste do SSD.
- O sistema passa a depender apenas da RAM física, evitando acessos ao disco para memória virtual.

## 🔒 Benefícios de Privacidade

- **hiberfil.sys** e **pagefile.sys** podem armazenar dados sensíveis temporários:
  - Conteúdo de memória RAM (documentos abertos, senhas, dados de aplicativos).
  - Informações que podem ser extraídas em análises forenses.
- Ao desativar ambos:
  - Reduz risco de **vazamento de informações** em arquivos ocultos.
  - Maior controle sobre o que permanece gravado no disco.

## ⚠️ Considerações Importantes

- **Sem hibernação**: não será possível usar o recurso de hibernar o PC (salvar estado da RAM no disco).
- **Sem pagefile**: alguns aplicativos que exigem memória virtual podem apresentar erros se a RAM física não for suficiente.
- Recomendado apenas em sistemas com **muita RAM disponível** (ex.: 16 GB ou mais).

## ▶️ Como Executar

1. Salve o script como: Get-Pagefile&Hibernation_Disable.ps1

2. Execute no PowerShell *como Administrador*:
.\Get-Pagefile&Hibernation_Disable.ps1 

3. Verifique o log gerado em:
C:\temp\Get-Pagefile&Hibernation_Disable_YYYY-MM-DD_HH-mm.log

✅ Conclusão
Este script é útil para:
Liberar espaço em disco (HD/SSD).
Reduzir desgaste em SSDs.
Aumentar privacidade, eliminando arquivos que podem conter dados sensíveis.
Use com cautela e apenas em sistemas que tenham memória RAM suficiente para operar sem pagefile.

