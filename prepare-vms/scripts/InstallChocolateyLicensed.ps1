$packagesPath = 'c:\packages'

Write-Host "Installing Chocolatey Licensed..."

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$licenseInstallationPath = "c:\programdata\chocolatey\license"

Write-Host "Checking to see if $licenseInstallationPath exists..."
if (!(Test-Path $licenseInstallationPath)) {
    New-Item -ItemType Directory -Path $licenseInstallationPath
    Write-Host "Directory created."
}

$licensePath = Join-Path -Path $packagesPath -ChildPath 'chocolatey.license.xml'
if (Test-Path -Path $licensePath) {
    Move-Item -Path $licensePath -Destination (Join-Path -Path $licenseInstallationPath -ChildPath 'chocolatey.license.xml') -Force
}
else {
    Write-Host "Unable to download Chocolatey Licensed"
}

choco upgrade chocolatey.extension -y --source="'c:\packages'"

# - not recommended for production systems
choco feature disable --name="'warnOnUpcomingLicenseExpiration'"
