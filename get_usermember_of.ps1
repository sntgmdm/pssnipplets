Get-ADPrincipalGroupMembership username | select name


get-aduser $username -Properties memberof | select -expand memberof


get-aduser ciarao -Properties memberof | select -expand memberof | Out-file .\ciarao.txt
get-aduser kevinf2 -Properties memberof | select -expand memberof | Out-file .\kevinf2.txt
get-aduser niamho -Properties memberof | select -expand memberof | Out-file .\niamho.txt
get-aduser sophiak -Properties memberof | select -expand memberof | Out-file .\sophiak.txt
get-aduser eleanorc -Properties memberof | select -expand memberof | Out-file .\eleanorc.txt
get-aduser mariaso -Properties memberof | select -expand memberof | Out-file .\mariaso.txt
get-aduser richardos -Properties memberof | select -expand memberof | Out-file .\richardos.txt
get-aduser joulesd -Properties memberof | select -expand memberof | Out-file .\joulesd.txt
