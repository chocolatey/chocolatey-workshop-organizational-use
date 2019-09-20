# create a local folder to hold assets
$azureSas = '?st=2019-09-20T08%3A24%3A30Z&se=2019-09-26T08%3A24%3A00Z&sp=rl&sv=2018-03-28&sr=c&sig=DNfi33JDiYPZrHAbNsaOs2yTCtITyEvjJPAy5%2FrF1aw%3D' #$env:AZURE_SAS
$azureContainer = 'https://winops2019.blob.core.windows.net/package-assets' #$env:AZURE_CONTAINER
$packagePath = 'c:\packages'

if (-not (Test-Path $packagePath)) {
    New-Item -Path $packagePath -ItemType Directory
}

# download each file and place it into the packages folder
@( 'chocolatey.0.10.15.nupkg',
    '7zip.install.19.0.nupkg',
    'adoptopenjdkjre.12.0.2.10.nupkg',
    'chocolatey.0.10.15.nupkg',
    'chocolatey.extension.2.0.2.nupkg',
    'chocolatey-agent.0.9.1.nupkg',
    'chocolatey-core.extension.1.3.3.nupkg',
    'chocolatey-dotnetfx.extension.1.0.0.nupkg',
    'chocolateygui.0.17.0-unstable0233.nupkg',
    'chocolatey-management-database.0.1.0-beta-20190501.nupkg',
    'chocolatey-management-service.0.1.0-beta-20190501.nupkg',
    'chocolatey-management-web.0.1.0-beta-20190501.nupkg',
    'DotNet4.5.2.4.5.2.20140902.nupkg',
    'dotnet4.6.2.4.6.01590.20190822.nupkg',
    'dotnet4.7.2.4.7.2.20180712.nupkg',
    'dotnetfx.4.8.0.0.nupkg',
    'dotnetversiondetector.17.1.2.nupkg',
    'Firefox.69.0.1.nupkg',
    'git.2.23.0.nupkg',
    'git.install.2.23.0.nupkg',
    'GoogleChrome.77.0.3865.90.nupkg',
    'KB2919355.1.0.20160915.nupkg',
    'KB2919442.1.0.20160915.nupkg',
    'malwarebytes.3.8.3.296512519.nupkg',
    'netfx-4.6.2.4.6.2.0.nupkg',
    'nexus-repository.3.18.1.01.nupkg',
    'notepadplusplus.install.7.7.1.nupkg',
    'puppet-agent.6.9.0.nupkg',
    'putty.0.72.nupkg',
    'putty.portable.0.72.nupkg',
    'vlc.3.0.8.nupkg',
    'vscode.1.38.1.nupkg',

    'vlc-2.2.8-win64.exe',
    'chocolatey.license.xml'
) | ForEach-Object {
    $uri = "{0}/{1}{2}" -f $azureContainer, $_, $azureSas
    $downloadPath = Join-Path -Path $packagePath -ChildPath $_
    Invoke-WebRequest -Uri $uri -UseBasicParsing -OutFile $downloadPath
}