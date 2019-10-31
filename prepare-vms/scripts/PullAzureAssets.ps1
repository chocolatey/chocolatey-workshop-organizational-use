# create a local folder to hold assets
$azureSas = $env:AZURE_SAS
$azureContainer = $env:AZURE_CONTAINER
$packagePath = 'c:\packages'
$installerPath = 'c:\installers'

if (-not (Test-Path $packagePath)) {
    New-Item -Path $packagePath -ItemType Directory
}

# download each file and place it into the packages folder
@( 'chocolatey.0.10.15.nupkg',
    'chocolatey-nexus-repo.1.0.0.nupkg',
    '7zip.install.19.0.nupkg',
    'adoptopenjdkjre.12.0.2.10.nupkg',
    'bginfo.4.25.nupkg',
    'chocolatey.extension.2.0.2.nupkg',
    'chocolatey-agent.0.9.1.nupkg',
    'chocolatey-core.extension.1.3.3.nupkg',
    'chocolatey-dotnetfx.extension.1.0.0.nupkg',
    'chocolateygui.0.17.0-unstable0233.nupkg',
    'chocolatey-management-database.0.1.0-beta-20190501.nupkg',
    'chocolatey-management-service.0.1.0-beta-20190501.nupkg',
    'chocolatey-management-web.0.1.0-beta-20190501.nupkg',
    'chocolatey-vscode.extension.1.1.0.nupkg',
    'chocolatey-windowsupdate.extension.1.0.4.nupkg',
    'DotNet4.5.2.4.5.2.20140902.nupkg',
    'dotnet4.6.2.4.6.01590.20190822.nupkg',
    'dotnet4.7.2.4.7.2.20180712.nupkg',
    'dotnetfx.4.8.0.0.nupkg',
    'dotnetversiondetector.17.1.2.nupkg',
    'Firefox.69.0.1.nupkg',
    'git.2.23.0.nupkg',
    'git.install.2.23.0.nupkg',
    'GoogleChrome.77.0.3865.90.nupkg',
    'KB2670838.1.0.20181019.nupkg',
    'KB2919355.1.0.20160915.nupkg',
    'KB2919442.1.0.20160915.nupkg',
    'malwarebytes.3.8.3.296512519.nupkg',
    'netfx-4.6.2.4.6.2.0.nupkg',
    'nexus-repository.3.18.1.01.nupkg',
    'notepadplusplus.install.7.7.1.nupkg',
    'paint.net.4.2.4.nupkg',
    'puppet-agent.6.10.1.nupkg',
    'puppet-bolt.1.35.0.nupkg',
    'putty.0.72.nupkg',
    'putty.portable.0.72.nupkg',
    'vlc.3.0.8.nupkg',
    'vscode.1.38.1.nupkg',
    'vscode-puppet.0.20.0.nupkg',

    'vlc-2.2.8-win64.exe',
    'mb3-setup-consumer-3.8.3.2965-1.0.625-1.0.12587.exe',
    'chocolatey.license.xml'
) | ForEach-Object {
    $uri = "{0}/{1}{2}" -f $azureContainer, $_, $azureSas
    $downloadPath = Join-Path -Path $packagePath -ChildPath $_
    Write-Host "Downloading asset: $_"
        Invoke-WebRequest -Uri $uri -UseBasicParsing -OutFile $downloadPath
}

New-Item -Path $installerPath -ItemType Directory
Move-Item -Path (Join-Path -Path $packagePath -ChildPath 'mb3-setup-consumer-3.8.3.2965-1.0.625-1.0.12587.exe') `
        -Destination (Join-Path -Path $installerPath -ChildPath 'mb3-setup-consumer-3.8.3.2965-1.0.625-1.0.12587.exe')

New-Item -Path 'c:\temp' -ItemType Directory