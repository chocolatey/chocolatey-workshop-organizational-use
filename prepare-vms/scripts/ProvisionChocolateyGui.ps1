choco upgrade chocolateygui --source='c:\packages' --pre -y --no-progress
chocolateyguicli feature enable -n=DefaultToTileViewForLocalSource
chocolateyguicli feature enable -n=DefaultToTileViewForRemoteSource
chocolateyguicli feature enable -n=ShowAdditionalPackageInformation


