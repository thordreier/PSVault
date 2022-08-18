# Open control panel GUI
control /name Microsoft.CredentialManager

# Set vault credential
Set-VaultCredential -Name Test1

# Get vault credential
Get-VaultCredential -Name Test1
