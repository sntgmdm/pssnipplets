$Table = @()

$Record = @{
  "Company" = ""
  "Name" = ""
  "Username" = ""
  "Office" = ""
}

$companies = Get-Content C:\Users\adminsme\companies.txt

foreach ($company in $companies){
  $userlist = get-ADUser -Properties * -Filter {company -eq $company } -SearchBase "OU=Germany,OU=Europe,DC=corp,DC=resmed,DC=org" | select company, name, samaccountname, office
  foreach ($user in $userlist) {
    $Record."Company" = $company
    $Record."Name" = $user.name
    $Record."UserName" = $user.samaccountname
    $Record."Office" = Get-ADUser -Identity $user.samaccountname -properties * | select-object office
    $objRecord = New-Object PSObject -property $Record
    $objRecord
    $Table += $objrecord
  }
}

$Table | export-csv .\usersbycompany.csv -NoTypeInformation
