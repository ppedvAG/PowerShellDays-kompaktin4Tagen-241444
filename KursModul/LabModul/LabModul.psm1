﻿function Write-RainbowText
{
[cmdletBinding()]
param(
    [Parameter(Mandatory=$true, 
               ValueFromPipeline = $true,
               ValueFromPipelineByPRopertyName = $true)]
    [Validatelength(2,256)]
    [string]$Name 
)
    Begin
    {
        Write-Verbose -Message "Wird einmal am Start ausgeführt, zb. Zum öffnen von RemoteVerbindungen"
    }
	Process
    {
        Write-Verbose -Message "Wird für jedes übergebene Objekt ausgeführt"
        $color = 0

        for($i = 0; $i -lt $Name.Length; $i++)
        {
            $color++

            Write-Host -Object $Name[$i] -NoNewline -ForegroundColor $color
        
            if($color -ge 15)
            {
                $color = 0
            }
        }
        Write-Host -Object ""
    }
    End
    {
        Write-Verbose -Message "Wird einmal am Ende ausgeführt. zb. zum schließen von Remote Verbindungen "
    }
}

function Write-TextWithoutSpaces
{
[cmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [Validatelength(2,256)]
    [string]$Text 
)

    $AlteredText = $Text.Replace(" ","")

    $AlteredText
}

function Test-ParameterSet
{
[cmdletBinding(DefaultParameterSetName="Set2")]
param(
[Parameter(Mandatory = $true, ParameterSetName="Set1")]
$param1,

[Parameter(Mandatory = $true, ParameterSetName="Set2")]
$param2,

[Parameter(Mandatory = $true, ParameterSetName="Set1")]
[Parameter(Mandatory = $false, ParameterSetName="Set2")]
$param3
)

Write-Host -Object "Es wurde folgendes ParameterSet verwendet: $($PSCmdlet.ParameterSetName)"
}