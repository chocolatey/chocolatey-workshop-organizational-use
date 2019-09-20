# install VLC as an installer
$vlcInstaller = Join-Path -Path 'c:\packages' -ChildPath 'vlc-2.2.8-win64.exe'
#Invoke-WebRequest -Uri 'https://mirror.vorboss.net/videolan/vlc/2.2.8/win64/vlc-2.2.8-win64.exe' -UseBasicParsing -OutFile $vlcInstaller

& $vlcInstaller /S