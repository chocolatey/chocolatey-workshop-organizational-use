$repoName = 'internalrepo'
$packagesPath = 'c:\packages'

# install nexus
choco install nexus-repository --source=$packagesPath

# get the nexus admin password
# wait for a little while longer as the password file isn't created straight away it appears
Start-Sleep -Seconds 10

$adminPw = Get-Content -Path c:\programdata\sonatype-work\nexus3\admin.password

# Install the chocolatey repository
choco install chocolatey-nexus-repo --version 1.0.0 --params="'/username=admin /password=$adminPw /repositoryname=$repoName'" --source='c:\packages'


# Get the API key for the admin user

$credPair = "admin:$adminPw"
$encodedCredentials = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($credPair))

$header = @{
    Authorization = "Basic $encodedCredentials"
}

$content = @"
import org.sonatype.nexus.security.authc.apikey.ApiKeyStore
import org.sonatype.nexus.security.realm.RealmManager
import org.apache.shiro.subject.SimplePrincipalCollection

def getOrCreateNuGetApiKey(String userName) {
    realmName = "NexusAuthenticatingRealm"
    apiKeyDomain = "NuGetApiKey"
    principal = new SimplePrincipalCollection(userName, realmName)
    keyStore = container.lookup(ApiKeyStore.class.getName())
    apiKey = keyStore.getApiKey(apiKeyDomain, principal)
    if (apiKey == null) {
        apiKey = keyStore.createApiKey(apiKeyDomain, principal)
    }
    return apiKey.toString()
}

getOrCreateNuGetApiKey("admin")
"@

$body = @{
    name    = "apikey"
    type    = "groovy"
    content = $content
}

#Store the Script
Invoke-RestMethod -Uri "http://localhost:8081/service/rest/v1/script" -ContentType 'application/json' -Body $($body | ConvertTo-Json) -Header $header -Method Post
#Run the script
$result = Invoke-RestMethod -Uri "http://localhost:8081/service/rest/v1/script/apikey/run" -ContentType 'text/plain' -Header $header -Method Post
#Delete the Script
Invoke-RestMethod -Uri "http://localhost:8081/service/rest/v1/script/apikey" -Header $header -Method Delete

$apikey = $result.result

# push the Chocolatey packages to the Nexus repo
Get-ChildItem 'c:\packages\*.nupkg' | ForEach-Object {
    choco push $_.FullName --source="http://localhost:8081/repository/$repoName/" --force --apikey=$apikey
}