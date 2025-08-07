# Monitoramento de Impressoras Offline com PowerShell

Este projeto contém um script PowerShell para monitorar impressoras específicas em um servidor Windows Server.  
Se alguma impressora monitorada ficar offline, o script reinicia automaticamente o serviço de spooler e envia um alerta por e-mail via Gmail.

## Funcionalidades

- Monitora impressoras específicas por nome.
- Reinicia o serviço de spooler automaticamente se alguma impressora estiver offline.
- Envia e-mail de alerta informando quais impressoras estavam offline.

## Pré-requisitos

- Windows Server 2019 (ou superior) com PowerShell.
- Conta Gmail com autenticação em dois fatores ativada.
- Senha de app do Google gerada ([saiba como gerar aqui](https://myaccount.google.com/apppasswords)).
- Permissão para executar scripts PowerShell no servidor.

## Como usar

1. **Clone este repositório ou copie o script para seu servidor.**

2. **Edite o script e configure:**
   - Os nomes das impressoras a serem monitoradas.
   - Seu e-mail do Gmail e a senha de app.
   - O e-mail de destino para receber os alertas.

3. **Salve o script, por exemplo, como:**
  - C:\Scripts\MonitorarImpressoras.ps1

4. **Teste o script manualmente:**
  powershell
  powershell -File "C:\Scripts\MonitorarImpressoras.ps1"

5. **Configure o agendamento automático pelo Agendador de Tarefas do Windows:**
  Agende a execução automática pelo Agendador de Tarefas do Windows:
  - Crie uma nova tarefa.
  - Configure para rodar a cada 5 ou 10 minutos, conforme sua necessidade.
  - Abra o Agendador de Tarefas.
  Na ação, use:
  - Programa/script: powershell.exe
  - Adicionar argumentos: -File "C:\Scripts\MonitorarImpressoras.ps1"
  - Marque para rodar com privilégios elevados.

![Descrição da imagem](/Img.jpeg)