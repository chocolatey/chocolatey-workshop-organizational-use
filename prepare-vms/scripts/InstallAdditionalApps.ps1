if ($null -eq (Get-Command -Name 'choco.exe' -ErrorAction SilentlyContinue)) {
  Write-Warning "Chocolatey not installed. Cannot install standard packages."
}
else {
  @( 'vscode', 'git', 'googlechrome', 'firefox', 'pester', 'chocolateygui' ) | ForEach-Object {
      choco upgrade $_ -y --no-progress
  }

    choco upgrade baretail --version 3.50.0.20120225 -y --no-progress
}
