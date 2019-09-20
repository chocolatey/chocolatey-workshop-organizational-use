Start-Transcript -Path C:\provision.log

net user vagrant /delete

Set-MpPreference -DisableRealtimeMonitoring $true

New-ItemProperty -Path HKCU:\Software\Microsoft\ServerManager -Name DoNotOpenServerManagerAtLogon -PropertyType DWORD -Value "1" -Force

function Get-HostToIP($hostname) {
  $result = [system.Net.Dns]::GetHostByName($hostname)
  $result.AddressList | ForEach-Object {$_.IPAddressToString }
}

Write-Host "provision.ps1"
Write-Host "HostName = $($HostName)"

$PublicIPAddress = Get-HostToIP($HostName)

Write-Host "PublicIPAddress = $($PublicIPAddress)"
Write-Host "USERPROFILE = $($env:USERPROFILE)"
Write-Host "pwd = $($pwd)"

Write-Host "Install bginfo"
[Environment]::SetEnvironmentVariable('FQDN', $HostName, [EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('PUBIP', $PublicIPAddress, [EnvironmentVariableTarget]::Machine)

refreshenv
$env:PATH=$env:PATH + ';C:\Program Files\Mozilla Firefox;C:\Program Files\Microsoft VS Code;C:\Program Files\Git\bin'
[Environment]::SetEnvironmentVariable('PATH', $env:PATH, [EnvironmentVariableTarget]::Machine)

# Adapted from http://stackoverflow.com/a/29571064/18475
$AdminKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}"
$UserKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}"
New-ItemProperty -Path $AdminKey -Name "IsInstalled" -Value 0 -Force | Out-Null
New-ItemProperty -Path $UserKey -Name "IsInstalled" -Value 0 -Force | Out-Null
#Stop-Process -Name Explorer -Force
Write-Host "IE Enhanced Security Configuration (ESC) has been disabled."

# http://techrena.net/disable-ie-set-up-first-run-welcome-screen/
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Internet Explorer\Main" -Name "DisableFirstRunCustomize" -Value 1 -PropertyType "DWord" -Force | Out-Null
Write-Host "IE first run welcome screen has been disabled."

Write-Host "Set Windows Updates to manual"
Cscript $env:WinDir\System32\SCregEdit.wsf /AU 1
Net stop wuauserv
Net start wuauserv

# Ensure there is a profile file so we can get tab completion
New-Item -ItemType Directory $(Split-Path $profile -Parent) -Force
Set-Content -Path $profile -Encoding UTF8 -Value "" -Force

winrm set winrm/config/winrs '@{MaxMemoryPerShellMB="2048"}'

Write-Host "Disable Windows Defender"
Set-MpPreference -DisableRealtimeMonitoring $true

Write-Host "Do not open Server Manager at logon"
New-ItemProperty -Path HKCU:\Software\Microsoft\ServerManager -Name DoNotOpenServerManagerAtLogon -PropertyType DWORD -Value "1" -Force

Write-Host "Disable autologon"
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name AutoAdminLogon -PropertyType DWORD -Value "0" -Force

# Create shortcuts
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\PowerShell.lnk")
$Shortcut.TargetPath = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
$shortcut.WorkingDirectory = "$Home"
$Shortcut.Save()

$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer'
$advancedKey = "$key\Advanced"
Set-ItemProperty $advancedKey Hidden 1
Set-ItemProperty $advancedKey HideFileExt 0
Set-ItemProperty $advancedKey ShowSuperHidden 1

$identity = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$parts = $identity.Name -split "\\"
$user = @{Domain=$parts[0];Name=$parts[1]}

try{
  try { $explorer = Get-Process -Name explorer -ErrorAction stop -IncludeUserName }
  catch {$global:error.RemoveAt(0)}

  if($explorer -ne $null) {
    $explorer | ? { $_.UserName -eq "$($user.Domain)\$($user.Name)"} | Stop-Process -Force -ErrorAction Stop | Out-Null
  }

  Start-Sleep 1

  if(!(Get-Process -Name explorer -ErrorAction SilentlyContinue)) {
    $global:error.RemoveAt(0)
    start-Process -FilePath explorer
  }
} catch {$global:error.RemoveAt(0)}

Write-Host "Cleaning up"
Remove-Item C:\provision.ps1

Restart-Computer
