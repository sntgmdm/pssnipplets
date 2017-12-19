$Groups = (Get-AdGroup -filter {name -like "KV_RM*"} -properties * | select name -ExpandProperty name)

$Table = @()

$Record = @{
  "Group Name" = ""
  "Name" = ""
  "Username" = ""
  "Description" = ""
  "Office" = ""
}


Foreach ($Group in $Groups) {

  $Arrayofmembers = Get-ADGroupMember -identity $Group -recursive | select name,samaccountname, description, office

  foreach ($Member in $Arrayofmembers) {
    $Record."Group Name" = $Group
    $Record."Name" = $Member.name
    $Record."UserName" = $Member.samaccountname
    $Record."Description" = Get-ADUser -Identity $Member.samaccountname -properties * | select-object description
    $Record."Office" = Get-ADUser -Identity $Member.samaccountname -properties * | select-object office
    $objRecord = New-Object PSObject -property $Record
    $objRecord
    $Table += $objrecord

  }
}

$Table | export-csv .\test.csv -NoTypeInformation
