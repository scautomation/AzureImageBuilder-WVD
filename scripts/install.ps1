#Install Active Directory Components
Add-WindowsCapability –online –Name “Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0”

start-sleep 30

New-Item -Path 'C:\temp' -ItemType Directory -Force | Out-Null

invoke-webrequest -uri 'https://github.com/scautomation/AzureImageBuilder-WVD/raw/master/installFiles/MissionAppsTrugreen.zip' -outfile 'c:\temp\missioappstrugreen.zip'

invoke-webrequest -uri 'https://github.com/scautomation/AzureImageBuilder-WVD/raw/master/installFiles/CSRCA01_v1.0.6_en-us.msi' -outfile 'c:\temp\CSRCA01_v1.0.6_en-us.msi'

<#
#Install Computer Associates
$path="c:\temp\CSRCA01_v1.0.6_en-us.msi"
Start-Process -FilePath msiexec.exe -ArgumentList '/i',$path,'/q' -Wait -PassThru -Verb "RunAs"

Expand-Archive -Path 'c:\temp\missioappstrugreen.zip' -DestinationPath c:\
#>