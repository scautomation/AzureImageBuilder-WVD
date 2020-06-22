New-Item -Path 'C:\temp' -ItemType Directory -Force | Out-Null

invoke-webrequest -uri 'https://github.com/scautomation/AzureImageBuilder-WVD/raw/master/installFiles/MissionAppsTrugreen.zip' -outfile 'c:\temp\MissionAppsTrugreen.zip'

invoke-webrequest -uri 'https://github.com/scautomation/AzureImageBuilder-WVD/raw/master/installFiles/CSRCA01_v1.0.6_en-us.msi' -outfile 'c:\temp\CSRCA01_v1.0.6_en-us.msi'


#Install Computer Associates
$path="c:\temp\CSRCA01_v1.0.6_en-us.msi"
Start-Process -FilePath msiexec.exe -ArgumentList '/i',$path, '/q' -PassThru -Verb "RunAs"

#expand zip file to c:\myapp
Expand-Archive -Path 'c:\temp\MissionAppsTrugreen.zip' -DestinationPath 'c:\' -force

#InstallFSLogix
Invoke-WebRequest -Uri 'https://aka.ms/fslogix_download' -OutFile 'c:\temp\fslogix.zip'
Start-Sleep -Seconds 10
Expand-Archive -Path 'C:\temp\fslogix.zip' -DestinationPath 'C:\temp\fslogix\'  -Force
Invoke-Expression -Command 'C:\temp\fslogix\x64\Release\FSLogixAppsSetup.exe /install /quiet /norestart'