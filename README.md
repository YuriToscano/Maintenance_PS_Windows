# 🖥️ Maintenance_PS_Windows

Scripts em **PowerShell** para manutenção do Windows.  
Cada pasta contém scripts específicos e um `README.md` explicando seu uso.

---

## 📂 Estrutura

Maintenance_PS_Windows/
│
├── manutencao_update
│   ├── SystemUpdate_Winget.ps1
│   └── README.md
│
├── manutencao_limpeza
│   ├── Clear_TempAndRecent.ps1
│   └── README.md
│
├── manutencao_rede
│   ├── Renovar_IP.ps1
│   ├── Limpar_DNS.ps1
│   ├── Testar_Conectividade.ps1
│   └── README.md
│
├── manutencao_sistema
│   ├── Verificar_Integridade.ps1
│   ├── Monitorar_Servicos.ps1
│   └── README.md
│
├── manutencao_segurança
│   ├── Checar_Defender.ps1
│   ├── Firewall_Status.ps1
│   └── README.md
│
└── README.md  ← este arquivo

- **manutencao_update** → Atualização de pacotes com winget  
- **manutencao_limpeza** → Limpeza de temporários e lixeira  
- **manutencao_rede** → Scripts de rede (IP, DNS, conectividade)  
- **manutencao_sistema** → Verificação de integridade e serviços  
- **manutencao_segurança** → Checagem de Defender e Firewall  

---

## 🚀 Como clonar

```bash
git clone https://github.com/YuriToscano/Maintenance_PS_Windows.git
cd Maintenance_PS_Windows
