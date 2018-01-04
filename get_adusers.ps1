get-aduser -Filter {enabled -eq "true"}  -SearchBase "OU=Europe,DC=corp,DC=resmed,DC=org" -properties * | Select-Object samaccountname, givenname, surname, co, office, userprincipalname, employeetype, AccountExpirationDate
