# Lista de impressoras a monitorar
$printersToCheck = @(
    "NOME_IMPRESSORA",
    "NOME_IMPRESSORA"
)

# Verifica se alguma das impressoras está offline
$offlinePrinters = Get-Printer | Where-Object {
    $printersToCheck -contains $_.Name -and $_.PrinterStatus -eq 'Offline'
}

if ($offlinePrinters) {
    $printerNames = $offlinePrinters | ForEach-Object { $_.Name } | Out-String
    Write-Output "Uma ou mais impressoras monitoradas estão offline. Reiniciando o serviço de spooler..."

    # Reinicia o serviço de spooler
    Restart-Service -Name spooler -Force

    # Envia e-mail de alerta via Gmail
    $smtpServer = "smtp.gmail.com"
    $smtpPort = 587
    $smtpUser = "seugmail@gmail.com"      # Seu e-mail do Gmail
    $smtpPass = "senha de app"            # Sua senha de app do Google
    $from = "seugmail@gmail.com"
    $to = "seugmail@gmail.com"      # Pode ser seu próprio e-mail ou outro
    $subject = "Alerta: Impressora(s) offline no servidor"
    $body = "As seguintes impressoras estavam offline e o serviço de spooler foi reiniciado:`n$printerNames"

    Send-MailMessage -From $from -To $to -Subject $subject -Body $body -SmtpServer $smtpServer -Port $smtpPort -Credential (New-Object System.Management.Automation.PSCredential($smtpUser, (ConvertTo-SecureString $smtpPass -AsPlainText -Force))) -UseSsl
} else {
    Write-Output "Todas as impressoras monitoradas estão online."
}