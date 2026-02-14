# 🧹 Manutenção - Limpeza

Scripts em PowerShell para limpeza de arquivos temporários, itens recentes e esvaziamento da lixeira.

## 📂 Scripts
- **Clear-TempAndRecent.ps1**  
  Remove arquivos temporários das pastas:
  - `C:\Windows\Prefetch`
  - `C:\Windows\Temp`
  - `C:\Users\<Usuário>\AppData\Local\Temp`
  - `C:\Users\<Usuário>\AppData\Roaming\Microsoft\Windows\Recent`
  - Esvazia a **Lixeira** de todos os usuários.
  - Gera log detalhado em `C:\Temp`.

## ▶️ Como usar
1. Abra o PowerShell como **Administrador**.
2. Execute o script:
   ```powershell
   .\Clear-TempAndRecent.ps1
