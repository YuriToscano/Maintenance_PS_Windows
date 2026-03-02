# 🖥️ Maintenance_PS_Windows

Scripts em **PowerShell** para manutenção e otimização do Windows 11.  
Este repositório reúne rotinas de atualização, limpeza, diagnóstico e ajustes de desempenho, cada uma organizada em subpastas com documentação própria.

## 📂 Estrutura do repositório

Maintenance_PS_Windows/
│
├── manutencao_update
│   ├── SystemUpdate-Winget.ps1
│   └── README.md
│
├── manutencao_limpeza
│   ├── Clear-TempAndRecent.ps1
│   └── README.md
│
├── manutencao_rede
│   ├── Renovar-IP.ps1
│   ├── Limpar-DNS.ps1
│   ├── Testar-Conectividade.ps1
│   └── README.md
│
├── manutencao_sistema
│   ├── Verificar-Integridade.ps1
│   ├── Monitorar-Servicos.ps1
│   └── README.md
│
├── manutencao_segurança
│   ├── Checar-Defender.ps1
│   ├── Firewall-Status.ps1
│   └── README.md
│
├── Pagefile&Hibernation
│   ├── Ajustar-Pagefile.ps1
│   ├── Desativar-Hibernacao.ps1
│   └── README.md
│
├── Prefetch
│   ├── Otimizar-Prefetch.ps1
│   └── README.md
│
└── README.md  ← este arquivo


---

## 🚀 Como clonar o repositório

1. Abra o **PowerShell** ou terminal.
2. Execute:
   ```bash
   git clone https://github.com/YuriToscano/Maintenance_PS_Windows.git
   cd Maintenance_PS_Windows

▶️ Como usar os scripts
Abra o PowerShell como Administrador.

Navegue até a pasta desejada:
cd .\manutencao_update\

3. Execute o script:
.\SystemUpdate-Winget.ps1

📝 Observações gerais
Todos os scripts geram logs com data e hora em C:\Temp.
Recomenda-se agendar execuções periódicas via Task Scheduler.
Este repositório é voltado para Windows 11, mas muitos scripts funcionam também em versões anteriores.
Cada subpasta possui um README.md com instruções detalhadas sobre os scripts disponíveis.

📌 Objetivo
Facilitar a manutenção preventiva e a otimização de desempenho do Windows 11 com scripts simples, reutilizáveis e documentados.
Ideal para administradores de sistemas, técnicos de suporte e usuários avançados.
