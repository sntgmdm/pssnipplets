#initialize and import the CSV file. Change the path according to where you saved the .csv file
$csvtable = @()
$csvtable = Import-Csv C:\Users\adminsme\Desktop\kumang.csv

#check and create the groups
foreach ($item in $csvtable){
    Try{
        #Check if the group exist, if it exist show it on the console and move the next item
        $exist = Get-ADGroup $item.Windowsgruppe
        Write-Host "Group $($item.Windowsgruppe) exist"
    }
    Catch{
        #Create new group in the OU: "OU=KUMAVision,OU=Groups,OU=Munich,OU=Germany,OU=Europe,DC=corp,DC=resmed,DC=org" with all the names like in the file after display in the console it has been created
        New-ADGroup -Name $item.Windowsgruppe -SamAccountName $item.Windowsgruppe -GroupCategory Security -GroupScope Global -DisplayName $item.Windowsgruppe -Path "OU=KUMAVision,OU=Groups,OU=Munich,OU=Germany,OU=Europe,DC=corp,DC=resmed,DC=org"
        Write-Host "Group $($item.Windowsgruppe) created"  
    }
}

#check and add the users to the created groups
foreach ($item in $csvtable){
    #save the members of the group into the $members var to check later.
    $members = Get-ADGroupMember -identity $item.Windowsgruppe
    #Check if the user is already a member of the group and bypass to the next user in the file    
    if ($members.samaccountname -contains $item.BenutzerID){
        Write-host "User $($item.BenutzerID) is already member of $($item.Windowsgruppe)"
    }
    else{
        #As the member is not part of the group add it into the group.
        Add-ADGroupMember -Identity $item.Windowsgruppe -Members $item.benutzerid
        Write-host "User $($item.BenutzerID) was added into $($item.Windowsgruppe)"
    }
}
