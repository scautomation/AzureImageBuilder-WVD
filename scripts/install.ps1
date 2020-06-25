New-Item -Path 'C:\temp' -ItemType Directory -Force | Out-Null


invoke-webrequest -uri 'https://aka.ms/downloadazcopy-v10-windows' -OutFile c:\temp\azcopy.zip
Expand-Archive 'c:\temp\azcopy.zip' c:\temp
copy-item "C:\temp\azcopy_windows_amd64_10.4.3\azcopy.exe" -Destination c:\temp


c:\temp\azcopy.exe copy 'https://prdcusaibstor.blob.core.windows.net/aib/ca1402.zip?sp=r&st=2020-06-25T18:59:08Z&se=2021-04-01T02:59:08Z&spr=https&sv=2019-10-10&sr=b&sig=QHlUJc421PbnRqYlSvAmgidnx0%2FxnBEx1pBtTbOh6r8%3D' c:\temp\cainstall.zip

c:\temp\azcopy.exe copy 'https://prdcusaibstor.blob.core.windows.net/aib/IBMJava.zip?sp=r&st=2020-06-25T17:41:38Z&se=2021-05-01T01:41:38Z&spr=https&sv=2019-10-10&sr=b&sig=HNj4wnPRzVrHpCvF2hVnIREZ2N5iNQhL2DQ%2Fi2NIVBY%3D' c:\temp\ibm.zip

Expand-Archive -Path 'c:\temp\cainstall.zip' c:\temp

Expand-Archive -Path 'c:\temp\ibm.zip' c:\temp

$path="c:\temp\java\jre1.8.0_201.msi"
Start-Process -FilePath msiexec.exe -ArgumentList '/i',$path, '/q' -PassThru -Verb "RunAs"
start-sleep -Seconds 30

$path="C:\temp\caExplorer\explorer.msi"
Start-Process -FilePath msiexec.exe -ArgumentList '/i',$path, '/q' -PassThru -Verb "RunAs"
start-sleep -Seconds 30

$path="c:\temp\ca1402\agtam.msi"
Start-Process -FilePath msiexec.exe -ArgumentList '/i',$path, '/q' -PassThru -Verb "RunAs"
start-sleep -Seconds 30

$path="c:\temp\ca1402\agtrc.msi"
Start-Process -FilePath msiexec.exe -ArgumentList '/i',$path, '/q' -PassThru -Verb "RunAs"
start-sleep -Seconds 30

$path="c:\temp\ca1402\agtrc.msi"
Start-Process -FilePath msiexec.exe -ArgumentList '/i',$path, '/q' -PassThru -Verb "RunAs"

start-sleep -Seconds 30

wscript.exe "C:\temp\IBM i Access\ClientSolutions\Windows_Application\install_acs_64_allusers.js"

start-sleep -Seconds 30

copy-item "C:\temp\Mission Icon\mission.hod" -Destination "C:\Users\Public\Desktop"

#InstallFSLogix
Invoke-WebRequest -Uri 'https://aka.ms/fslogix_download' -OutFile 'c:\temp\fslogix.zip'
Start-Sleep -Seconds 10
Expand-Archive -Path 'C:\temp\fslogix.zip' -DestinationPath 'C:\temp\fslogix\'  -Force
Invoke-Expression -Command 'C:\temp\fslogix\x64\Release\FSLogixAppsSetup.exe /install /quiet /norestart'