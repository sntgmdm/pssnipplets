$table = get-childitem \\corp.resmed.org\dublin\Home

$Record = @{
  "Path" = ""
  "Owner" = ""
  "Access" = ""    
}
foreach($file in $table){
    Get-Acl -Path \\corp.resmed.org\dublin\Home\$file | Format-Table -AutoSize -Wrap
}
