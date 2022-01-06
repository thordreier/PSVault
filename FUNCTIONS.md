# PSVault

Text in this document is automatically created - don't change it manually

## Index

[Get-VaultCredential](#Get-VaultCredential)<br>
[Set-VaultCredential](#Set-VaultCredential)<br>

## Functions

<a name="Get-VaultCredential"></a>
### Get-VaultCredential

```

NAME
    Get-VaultCredential
    
SYNOPSIS
    Get vault credential
    
    
SYNTAX
    Get-VaultCredential [-Name] <String> [<CommonParameters>]
    
    
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
    
    PS C:\>Get-VaultCredential -Name cred1
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>(Get-VaultCredential -Name cred2).GetNetworkCredential().Password
    
    
    
    
    
    
REMARKS
    To see the examples, type: "get-help Get-VaultCredential -examples".
    For more information, type: "get-help Get-VaultCredential -detailed".
    For technical information, type: "get-help Get-VaultCredential -full".

```

<a name="Set-VaultCredential"></a>
### Set-VaultCredential

```
NAME
    Set-VaultCredential
    
SYNOPSIS
    Set vault credential
    
    
SYNTAX
    Set-VaultCredential [-Name] <String> [-Credential] <PSCredential> [<CommonParameters>]
    
    Set-VaultCredential [-Name] <String> -Username <String> -Password <Object> [<CommonParameters>]
    
    
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
    
    PS C:\>Set-VaultCredential -Name cred1
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>Set-VaultCredential -Name cred2 -Username userx -Password sEcReT
    
    
    
    
    
    
REMARKS
    To see the examples, type: "get-help Set-VaultCredential -examples".
    For more information, type: "get-help Set-VaultCredential -detailed".
    For technical information, type: "get-help Set-VaultCredential -full".

```



