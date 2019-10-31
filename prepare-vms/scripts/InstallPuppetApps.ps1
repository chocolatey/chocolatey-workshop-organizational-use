if ($null -eq (Get-Command -Name 'choco.exe' -ErrorAction SilentlyContinue)) {
  Write-Warning "Chocolatey not installed. Cannot install standard packages."
}
else {
    @( 'puppet-agent' ) | ForEach-Object {
      choco upgrade $_ -y --no-progress --source='c:\packages'
  }
}

& 'C:\Program Files\Puppet Labs\Puppet\bin\puppet.bat' module install puppetlabs/windows
