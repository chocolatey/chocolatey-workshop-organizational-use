choco source add --name='internalrepo' --source='http://localhost:8081/repository/internaprepo'

# Prerequosite packages required
choco install IIS-WebServer --source windowsfeatures
choco install IIS-ApplicationInit --source windowsfeatures

choco upgrade vscode -y --package-parameters="'/NoDesktopIcon'"
choco upgrade aspnetcore-runtimepackagestore -y
choco upgrade dotnetcore-windowshosting -y
choco upgrade MsSqlServer2014Express -y
choco upgrade sql-server-management-studio -y

# to view pdf reports on the server
choco install adobereader -y

# Install CCM
choco upgrade chocolatey-management-database -y --source="'c:\packages;chocolatey'" --pre --params='/SqlServerInstance=localhost\SQLEXPRESS'

# Add ccmdbserver\ccmserviceuser as owner of ChocolateyManagement Database
$username = "$($env:COMPUTERNAME)\ChocolateyLocalAdmin"
$database = 'ChocolateyManagement'
$chocolateyLocalAdminQuery = "
USE [master]
CREATE LOGIN [$username] FROM WINDOWS WITH DEFAULT_DATABASE=[master]
USE [$database]
CREATE USER [$username] FOR LOGIN [$username]
USE [$database]
ALTER ROLE [db_owner] ADD MEMBER [$username]
"

$Connection = New-Object System.Data.SQLClient.SQLConnection
$Connection.ConnectionString = "server='localhost\SQLEXPRESS';database='master';trusted_connection=true;"
$Connection.Open()
$Command = New-Object System.Data.SQLClient.SQLCommand
$Command.CommandText = $chocolateyLocalAdminQuery
$Command.Connection = $Connection
$Command.ExecuteNonQuery()
$Connection.Close()

choco upgrade chocolatey-management-service -y --source="'c:\packages;chocolatey'" --pre --params='/SqlServerInstance=localhost\SQLEXPRESS'
choco upgrade chocolatey-management-web -y --source="'c:\packages;chocolatey'" --pre --params='/SqlServerInstance=localhost\SQLEXPRESS'

$appPoolUserName = 'IIS APPPOOL\ChocolateyCentralManagement'
$chocolateyAppPoolQuery = "
USE [master]
CREATE LOGIN [$appPoolUserName] FROM WINDOWS WITH DEFAULT_DATABASE=[master]
USE [$database]
CREATE USER [$appPoolUserName] FROM LOGIN [$appPoolUserName]
USE [$database]
ALTER ROLE [db_owner] ADD MEMBER [$appPoolUserName]
"

$Connection = New-Object System.Data.SQLClient.SQLConnection
$Connection.ConnectionString = "server='localhost\SQLEXPRESS';database='master';trusted_connection=true;"
$Connection.Open()
$Command = New-Object System.Data.SQLClient.SQLCommand
$Command.CommandText = $chocolateyAppPoolQuery
$Command.Connection = $Connection
$Command.ExecuteNonQuery()
$Connection.Close()

# CCM Configuration
choco config set centralManagementReportPackagesTimerIntervalInSeconds 1800 # Should be 1800 (i.e. 30 minutes)
choco config set centralManagementServiceUrl "https://$($env:COMPUTERNAME):24020/ChocolateyManagementService"
choco config set centralManagementReceiveTimeoutInSeconds 60
choco config set centralManagementSendTimeoutInSeconds 60
choco config set centralManagementCertificateValidationMode "PeerOrChainTrust"
choco feature enable --name="'useChocolateyCentralManagement'"

#choco feature enable --name="'useBackgroundService'"
#choco feature enable --name="'useBackgroundServiceWithNonAdministratorsOnly'"
