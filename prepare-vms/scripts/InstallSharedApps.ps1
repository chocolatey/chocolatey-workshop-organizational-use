if ($null -eq (Get-Command -Name 'choco.exe' -ErrorAction SilentlyContinue)) {
  Write-Warning "Chocolatey not installed. Cannot install standard packages."
}
else {
    @( 'dotnetversiondetector', '7zip.install', 'vscode', 'git', 'googlechrome', 'firefox',
        'dotnet4.5.2', 'dotnet4.6.2', 'dotnet4.7.2', 'puppet-agent', 'chocolatey-agent', 'chocolatey-core.extension',
        'chocolatey-dotnetfx.extension' ) | ForEach-Object {
      choco upgrade $_ -y --no-progress --source='c:\packages'
  }
}

& 'C:\Program Files\Puppet Labs\Puppet\bin\puppet.bat' module install puppetlabs/windows
