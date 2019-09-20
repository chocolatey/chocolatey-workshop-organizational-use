$pwd = ConvertTo-SecureString -String 'Password01' -AsPlainText -Force
New-LocalUser "selfservice" -Password $pwd -FullName "Self Service User" -Description "Allows you to use Self Service."