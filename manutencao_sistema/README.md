# ⚙️ Manutenção - Sistema

Scripts em PowerShell para verificação e reparo do sistema operacional.

## 📂 Scripts
- **Verificar_Integridade.ps1** → Executa `sfc /scannow` e `DISM`.
- **Monitorar_Servicos.ps1** → Lista serviços críticos e reinicia se necessário.

## ▶️ Como usar
1. Abra o PowerShell como **Administrador**.
2. Execute o script desejado:
   ```powershell
   .\Verificar_Integridade.ps1
