function Get-VaultCredential
{
    <#
        FIXXXME - write help stuff
    #>

    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true,  ValueFromPipelineByPropertyName=$true, Position = 0)]
        [string]
        $Name
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

            $vault = New-Object -TypeName 'Windows.Security.Credentials.PasswordVault'

            $vaultcredential = $vault.FindAllByResource($Name)
            if ($vaultcredential.AdditionalTypeData)
            {
                # PS Core
                $vaultcredential = $vaultcredential.AdditionalTypeData.GetEnumerator() | Select-Object -First 1 -ExpandProperty Value | Select-Object -First 1
            }
            else
            {
                $vaultcredential = $vaultcredential | Select-Object -First 1
            }

            $null = $vaultcredential.RetrievePassword()
            $username = $vaultcredential.UserName
            $password = $vaultcredential.Password
            $credential = [pscredential]::new($username, ($password | ConvertTo-SecureString -AsPlainText -Force))

            # Return
            $credential
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
