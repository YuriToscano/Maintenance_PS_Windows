# Maintenance_PS_Windows

# 🛠️ Maintenance-PS-Windows

Scripts em **PowerShell** para limpeza e manutenção do Windows.  
Este repositório contém utilitários que ajudam a manter o sistema limpo, removendo arquivos temporários, itens recentes e esvaziando a lixeira de todos os usuários.

---

## 📂 Funcionalidades
- Limpeza das pastas:
  - `C:\Windows\Prefetch`
  - `C:\Windows\Temp`
  - `C:\Users\<Usuário>\AppData\Local\Temp`
  - `C:\Users\<Usuário>\AppData\Roaming\Microsoft\Windows\Recent`
- Esvaziamento da **Lixeira** de todos os usuários.
- Geração de **log detalhado** em `C:\Temp` com data e hora da execução.

---

## 📜 Script principal

Arquivo: **Clear-TempAndRecent.ps1**

- Executar sempre como **Administrador**.
- Cria um log em `C:\Temp\CleanupLog-YYYYMMDD-HHMMSS.txt`.

---

## ▶️ Como usar

1. Clone este repositório:
   ```bash
   git clone https://github.com/seu-usuario/Maintenance_PS_Windows.git
