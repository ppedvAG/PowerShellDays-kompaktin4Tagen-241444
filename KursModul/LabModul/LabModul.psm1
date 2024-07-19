function Write-RainbowText
{
[cmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [Validatelength(2,256)]
    [string]$Text 
)
    $color = 0

    for($i = 0; $i -lt $Text.Length; $i++)
    {
        $color++

        Write-Host -Object $Text[$i] -NoNewline -ForegroundColor $color
        
        if($color -ge 15)
        {
            $color = 0
        }
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