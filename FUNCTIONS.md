# PSVault

Text in this document is automatically created - don't change it manually

## Index

[Get-WindowsVaultCredential](#Get-WindowsVaultCredential)<br>
[Set-WindowsVaultCredential](#Set-WindowsVaultCredential)<br>

## Functions

<a name="Get-WindowsVaultCredential"></a>
### Get-WindowsVaultCredential

```

NAME
    Get-WindowsVaultCredential
    
SYNOPSIS
    Get vault credential
    
    
SYNTAX
    Get-WindowsVaultCredential [-Name] <String> [<CommonParameters>]
    
    
DESCRIPTION
    Get vault credential
    

PARAMETERS
    -Name <String>
        Name of credential entry
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (https:/go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Get-WindowsVaultCredential -Name cred1
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>(Get-WindowsVaultCredential -Name cred2).GetNetworkCredential().Password
    
    
    
    
    
    
REMARKS
    To see the examples, type: "get-help Get-WindowsVaultCredential -examples".
    For more information, type: "get-help Get-WindowsVaultCredential -detailed".
    For technical information, type: "get-help Get-WindowsVaultCredential -full".

```

<a name="Set-WindowsVaultCredential"></a>
### Set-WindowsVaultCredential

```
NAME
    Set-WindowsVaultCredential
    
SYNOPSIS
    Set vault credential
    
    
SYNTAX
    Set-WindowsVaultCredential [-Name] <String> [-Credential] <PSCredential> [<CommonParameters>]
    
    Set-WindowsVaultCredential [-Name] <String> -Username <String> -Password <Object> [<CommonParameters>]
    
    
DESCRIPTION
    Set vault credential
    

PARAMETERS
    -Name <String>
        Name of credential entry
        
    -Credential <PSCredential>
        Credential object with username/password to store in vault
        
    -Username <String>
        Username to store in vault
        
    -Password <Object>
        Password to store in vault
        Either [string] or [securestring]
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (https:/go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Set-WindowsVaultCredential -Name cred1
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>Set-WindowsVaultCredential -Name cred2 -Username userx -Password sEcReT
    
    
    
    
    
    
REMARKS
    To see the examples, type: "get-help Set-WindowsVaultCredential -examples".
    For more information, type: "get-help Set-WindowsVaultCredential -detailed".
    For technical information, type: "get-help Set-WindowsVaultCredential -full".

```



