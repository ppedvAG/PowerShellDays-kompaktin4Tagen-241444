<#
.SYNOPSIS 
 Kurzbeschreibung: Dieses Skript frägt Logon bezogene Events ab
.DESCRIPTION
 Längere ausführlichere Beschreibung
 Dieses Skript dient dazu aus dem Security Event Log Events der Typen : Logon, Logoff, failed Logon abzufragen
.PARAMETER EventId
 Dieser Parameter definiert die EventId welche abgefragt wird. Es sind folgende Werte möglich:
 4624 : Anmeldung
 4625 : fehlgeschlagene Anmeldung
 4634 : Abmeldung
.PARAMETER Newest
 Hiermit wird angegeben wie viele Elemente abgefragt werden
.EXAMPLE
   Skriptbeispiel\Get-Eventlog.ps1 -EventId 4634

   Index Time          EntryType   Source                 InstanceID Message
   ----- ----          ---------   ------                 ---------- -------
  739805 Jul 18 13:45  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
  739790 Jul 18 13:44  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
  739787 Jul 18 13:44  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
  739784 Jul 18 13:44  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
  739783 Jul 18 13:44  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....

  In diesem Beispiel werden die aktuellesten 5 Abmelde Events abgefragt
.LINK
 https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help?view=powershell-5.1#syntax-for-comment-based-help-in-functions
#>
[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[int]$EventId,

[int]$Newest = 5 ,

[string]$Computername = "localhost"
)

Write-Verbose -Message "Ich bin eine zusätzliche optionale Ausgabe"

Get-EventLog -LogName Security -ComputerName $Computername | Where-Object EventId -eq $EventId | Select-Object -First $Newest

