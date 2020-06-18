#Install Active Directory Components
Add-WindowsCapability –online –Name “Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0”

start-sleep 30

New-Item -Path 'C:\temp' -ItemType Directory -Force | Out-Null

invoke-webrequest -uri 'https://github.com/scautomation/AzureImageBuilder-WVD/raw/master/installFiles/MissionAppsTrugreen.zip' -outfile 'c:\temp\MissionAppsTrugreen.zip'

invoke-webrequest -uri 'https://github.com/scautomation/AzureImageBuilder-WVD/raw/master/installFiles/CSRCA01_v1.0.6_en-us.msi' -outfile 'c:\temp\CSRCA01_v1.0.6_en-us.msi'


#Install Computer Associates
$path="c:\temp\CSRCA01_v1.0.6_en-us.msi"
#Start-Process -FilePath msiexec.exe -ArgumentList '/i',$path,'/q' -Wait -PassThru -Verb "RunAs"

#expand zip file to c:\myapp
Expand-Archive -Path 'c:\temp\MissionAppsTrugreen.zip' -DestinationPath 'c:\' -force -Confirm