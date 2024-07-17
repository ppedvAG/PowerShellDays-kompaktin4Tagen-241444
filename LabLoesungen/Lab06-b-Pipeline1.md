# Lösung zu Lab: PipeLine 1 (Variante ohne AD)
### 1.
```powershell
Get-Process | Sort-Object -Property |Select-Object -Property ProcessName
```
---
### 2.
```powershell
Get-Process | Sort-Object -Property ProcessName | Format-Table
```
---
### 3.
```powershell
Get-Process -Name svchost | Measure-Object
```
---
### 4.
```powershell
Get-Process | Sort-Object -Property PM | Select-Object -Last 3
#oder
Get-Process | Sort-Object -Property PM -Descending | Select-Object -First 3
```