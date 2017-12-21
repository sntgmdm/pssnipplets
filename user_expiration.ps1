$userlist = Get-Content C:\Users\adminsme\fdbulist.txt
Foreach ($user in $userlist){
  get-Aduser -Identity $user -properties * | select-object name, @{N='Manager';E={(Get-ADUser $_.Manager).Name}}, AccountExpirationDate

}
