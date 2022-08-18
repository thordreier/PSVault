# PSVault

PowerShell functions to interact with Windows Credential Vault.

## Usage

### Examples

```powershell
# Open control panel GUI
control /name Microsoft.CredentialManager

# Set vault credential
Set-VaultCredential -Name Test1

# Get vault credential
Get-VaultCredential -Name Test1

```

Examples are also found in [EXAMPLES.ps1](EXAMPLES.ps1).

### Functions

See [FUNCTIONS.md](FUNCTIONS.md) for documentation of functions in this module.

## Install

### Install module from PowerShell Gallery

```powershell
Install-Module PSVault
```

### Install module from source

```powershell
git clone https://github.com/thordreier/PSVault.git
cd PSVault
git pull
.\Build.ps1 -InstallModule
```

