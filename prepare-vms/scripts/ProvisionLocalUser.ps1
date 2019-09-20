$pwd = ConvertTo-SecureString -String 'Password01' -AsPlainText -Force
New-LocalUser -Name "selfservice" -Password $pwd -FullName "Self Service User" -Description "Allows you to use Self Service." -UserMayNotChangePassword -PasswordNeverExpires
Add-LocalGroupMember -Group 'Users' -Member 'selfservice'