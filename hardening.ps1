Write-Host "=== HARDENING CHECK ==="

# Firewall
Write-Host "`n[Firewall]"
$firewall = Get-NetFirewallProfile

if ($firewall) {
    $firewall | Select Name, Enabled
} else {
    Write-Host "Not found"
}

# Antivirus
Write-Host "`n[Antivirus]"
$av = Get-MpComputerStatus -ErrorAction SilentlyContinue

if ($av) {
    $av | Select AntivirusEnabled
} else {
    Write-Host "Not found"
}

# Updates
Write-Host "`n[Updates]"
$updates = Get-HotFix -ErrorAction SilentlyContinue | Select-Object -First 3

if ($updates) {
    $updates
} else {
    Write-Host "Not found"
}

# Admin Users
Write-Host "`n[Admin Users]"

$admins = Get-LocalGroupMember Administrators -ErrorAction SilentlyContinue

if (-not $admins) {
    $admins = Get-LocalGroupMember Administradores -ErrorAction SilentlyContinue
}

if ($admins) {
    $admins
} else {
    Write-Host "Not found"
}

Write-Host "`n=== END ==="