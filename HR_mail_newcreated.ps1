import-module ActiveDirectory
$checktime = (get-date).adddays(-35)
get-aduser -searchbase "OU=Users,OU=LSP01,OU=DE_MA,DC=rf360jv,DC=biz" -Properties * -filter {whencreated -ge $checktime} | Select-Object givenname, surname, emailaddress, extensionattribute7, whencreated | Export-Csv new_user_maillist_$((Get-Date).ToString('dd-MM-yyyy')).csv
