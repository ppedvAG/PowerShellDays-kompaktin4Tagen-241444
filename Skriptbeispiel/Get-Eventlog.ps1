param(
$EventId,
$Newest ,
$Computername
)

Get-EventLog -LogName Security -ComputerName $Computername | Where-Object EventId -eq 4624 | Select-Object -First 10

