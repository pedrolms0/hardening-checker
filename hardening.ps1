Write-Host "=== HARDENING CHECK ==="

Write-Host "`n[Firewall]"
Get-NetFirewallProfile | Select Name, Enabled

Write-Host "`n[Antivirus]"
Get-MpComputerStatus | Select AntivirusEnabled

Write-Host "`n[Updates]"
Get-HotFix | Select-Object -First 3

Write-Host "`n[Admin Users]"
Get-LocalGroupMember Administrators

Write-Host "`n=== END ==="