

$userlist = Get-Content C:\Users\adminsme\ext_kbc.txt
Foreach ($user in $userlist){
  get-Aduser -Identity $user -properties * | select-object name, @{N='Manager';E={(Get-ADUser $_.Manager).Name}}, AccountExpirationDate
  Set-ADAccountExpiration -identity $user -DateTime "01/07/2018"
  set-aduser $user -Manager tihomirf
  get-Aduser -Identity $user -properties * | select-object name, @{N='Manager';E={(Get-ADUser $_.Manager).Name}}, AccountExpirationDate
}
