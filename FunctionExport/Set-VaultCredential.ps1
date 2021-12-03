function Set-VaultCredential
{
    <#
        FIXXXME - write help stuff
    #>

    [CmdletBinding(DefaultParameterSetName='PSCredential')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingPlainTextForPassword','')]
    param
    (
        [Parameter(Mandatory=$true,  ValueFromPipelineByPropertyName=$true, Position = 0)]
        [string]
        $Name,

        [Parameter(Mandatory=$true,  ValueFromPipelineByPropertyName=$true, Position = 1, ParameterSetName='PSCredential')]
        [pscredential]
        $Credential,

        [Parameter(Mandatory=$true,  ValueFromPipelineByPropertyName=$true, ParameterSetName='UserPass')]
        [string]
        $Username,

        [Parameter(Mandatory=$true,  ValueFromPipelineByPropertyName=$true, ParameterSetName='UserPass')]
        [object]
        $Password
    )

    begin
    {
        Write-Verbose -Message "Begin (ErrorActionPreference: $ErrorActionPreference)"
        $origErrorActionPreference = $ErrorActionPreference
        $verbose = $PSBoundParameters.ContainsKey('Verbose') -or ($VerbosePreference -ne 'SilentlyContinue')
    }

    process
    {
        Write-Verbose -Message "Process begin (ErrorActionPreference: $ErrorActionPreference)"

        try
        {
            # Make sure that we don't continue on error, and that we catches the error
            $ErrorActionPreference = 'Stop'

            # FIXXXME - maybe this should't be called every time in here!
            $null = [Windows.Security.Credentials.PasswordVault,Windows.Security.Credentials,ContentType=WindowsRuntime]
            $vault = New-Object -TypeName 'Windows.Security.Credentials.PasswordVault'

            if ($Password -is [securestring])
            {
                $Credential = [pscredential]::new($Username, $Password)
            }

            if ($Credential)
            {
                $Username = $Credential.UserName
                $Password = $Credential.GetNetworkCredential().Password
            }
            else
            {
                $Password = [string] $Password
            }
            
            $null = [Windows.Security.Credentials.PasswordVault,Windows.Security.Credentials,ContentType=WindowsRuntime]
            $vaultcredential = [Windows.Security.Credentials.PasswordCredential]::new($Name, $Username, $Password)
            $vault = New-Object -TypeName 'Windows.Security.Credentials.PasswordVault'
            $vault.Add($vaultcredential)
        }
        catch
        {
            Write-Verbose -Message "Encountered an error: $_"
            Write-Error -ErrorAction $origErrorActionPreference -Exception $_.Exception
        }
        finally
        {
            $ErrorActionPreference = $origErrorActionPreference
        }

        Write-Verbose -Message 'Process end'
    }

    end
    {
        Write-Verbose -Message 'End'
    }
}
