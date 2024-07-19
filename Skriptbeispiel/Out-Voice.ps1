[cmdletBinding()]
param(
[Parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelineByPropertyName = $true)]
[string]$Text
)

Begin
{
    Add-Type -AssemblyName System.Speech
    $speaker = New-Object -TypeName System.Speech.Synthesis.SpeechSynthesizer

    $audiosrv = Get-Service -Name Audiosrv
    if($audiosrv.Status -ne "Running")
    {
        $audiosrv.Start()
    }
}
Process
{
    $speaker.Rate = -5
    $speaker.Speak($Text)
}
End
{

}