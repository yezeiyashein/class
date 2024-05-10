$output = Get-NetTCPConnection | Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort, State, OwningProcess, @{n='ProcessName';e={(Get-Process -Id $_.OwingProcess).ProcessName}} | format-table
$output += Get-Process
$output += Get-WmiObject -Class Win32_product | format-table
$output += Get-WmiObject -Class win32_physicalmemory | format-table
$output += Get-WmiObject Win32_VideoController
$output += systeminfo | format-table
$output += Get-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store"
Write-Output $output |clip
Write-Host "Data Copied to your clipboard, please paste this data in an new paste at paste.offsec.com (don't copy the url!)" -ForegroundColor Green
