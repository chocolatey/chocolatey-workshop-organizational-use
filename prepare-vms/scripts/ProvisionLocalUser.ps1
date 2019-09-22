[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidUsingConvertToSecureStringWithPlainText", "", Justification = "We need to embed the password")]
Param ()

$pwd = ConvertTo-SecureString -String 'Password01' -AsPlainText -Force
New-LocalUser -Name "selfservice" -Password $pwd -FullName "Self Service User" -Description "Allows you to use Self Service." -UserMayNotChangePassword -PasswordNeverExpires
'Users', 'Remote Desktop Users' | ForEach-Object { Add-LocalGroupMember -Group $_ -Member 'selfservice' }