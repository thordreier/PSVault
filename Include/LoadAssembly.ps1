Write-Verbose -Message "Loading assembly"
$origErrorActionPreference = $ErrorActionPreference
$ErrorActionPreference = 'Stop'
try
{
    $null = [Windows.Security.Credentials.PasswordVault,Windows.Security.Credentials,ContentType=WindowsRuntime]
}
catch
{
    # PS Core
    $null = Add-Type -AssemblyName (Join-Path -Path $PSScriptRoot -ChildPath 'WinRT.Runtime.dll')
    $null = Add-Type -AssemblyName (Join-Path -Path $PSScriptRoot -ChildPath 'Microsoft.Windows.SDK.NET.dll')
}
finally
{
    $ErrorActionPreference = $origErrorActionPreference
}
