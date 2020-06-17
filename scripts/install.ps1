#Install Active Directory Components
Add-WindowsCapability –online –Name “Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0”

#Install Computer Associates
$path="c:\temp\MissionUpdate\CSRCA01_v1.0.6_en-us.msi"
Start-Process -FilePath msiexec.exe -ArgumentList '/i',$path,'/q' -Wait -PassThru -Verb "RunAs"
