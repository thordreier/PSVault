# PSVault

PowerShell functions getting credentials from Windows Vault.

## Functions

See [FUNCTIONS.md](FUNCTIONS.md) for usage of this module.

## Install

### Install module from PowerShell Gallery

```
Install-Module PSVault
```

### Install module from source

```
git clone https://github.com/thordreier/PSVault.git
cd PSVault
.\Build.ps1 -InstallModule
```

## Usage

```
# Open control panel GUI
control /name Microsoft.CredentialManager

# Set vault credential
Set-VaultCredential -Name Test1

# Get vault credential
Get-VaultCredential -Name Test1
```
