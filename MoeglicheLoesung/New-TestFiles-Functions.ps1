﻿<#
.Synopsis
   TestFiles erstellen
.DESCRIPTION
   Skript zum anlegen von Test Dateien.
.EXAMPLE
   Beispiel für die Verwendung dieses Cmdlets
.EXAMPLE
   Ein weiteres Beispiel für die Verwendung dieses Cmdlets
#>
[cmdletBinding()]
param(
[ValidateScript({Test-Path -Path $PSItem -Pathtype Container})]
[Parameter(Mandatory=$true)]
[string]$Path,

[Validatelength(3,20)]
[string]$Name = "Testfiles2",

[ValidateRange(0,99)]
[int]$DirCount = 2,

[ValidateRange(1,99)]
[int]$FileCount = 9,

[switch]$Force
)
# Funktionen Start
function New-TestFiles
{
    [cmdletBinding()]
    param(
        [ValidateScript({Test-Path -Path $PSItem -PathType Container})]
        [Parameter(Mandatory = $true)]
        [string]$Path,

        [ValidateRange(1,99)]
        [int]$FileCount,

        [Validatelength(3,20)]
        [string]$Name = "File_"
    )

    for($i = 1; $i -le $FileCount; $i++)
    {
        $Number = "{0:D3}" -f $i
        $Filename = "$Name" + $Number + ".txt"

        New-Item -Path $Path -Name $Filename -ItemType File
    }
}
# Funktionen Ende

[string]$TestDirPath = Join-Path -Path $Path -ChildPath $Name

if(Test-Path -Path $TestDirPath -PathType Container)
{
    if($Force)
    {
        Remove-Item -Path $TestDirPath -Recurse -Force
    }
    else
    {
        Write-Host -Object "Ordner bereits vorhanden" -ForegroundColor Red
        exit
    }
}

$TestDir = New-Item -Path $Path -Name $Name -ItemType Directory

New-TestFiles -Path $TestDir.FullName -FileCount $FileCount
<# ersetzt durch Funktion
for($i = 1; $i -le $FileCount; $i++)
{
    $Number = "{0:D3}" -f $i
    $Filename = "File_" + $Number + ".txt"

    New-Item -Path $TestDir.FullName -Name $Filename -ItemType File
} #>

for($i = 1; $i -le $DirCount; $i++)
{
    $DNumber = "{0:D3}" -f $i
    $DirName = "Dir" + $DNumber 

    $Subdir = New-Item -Path $TestDir.FullName -Name $DirName -ItemType Directory
    
    New-TestFiles -Path $Subdir.FullName -FileCount $FileCount -Name ($DirName + "-File_")
    <# Ersetzt durch Funktion 
    for($j = 1; $j -le $FileCount; $j++)
    {
        $FNumber = "{0:D3}" -f $j  
        $FileName = "Dir$DNumber" + "-File" + $FNumber + ".txt" 

        New-Item -Path $Subdir.FullName -Name $Filename -ItemType File
    }
    #>
}


