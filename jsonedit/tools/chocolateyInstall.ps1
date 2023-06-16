$packageName    = 'jsonedit'
$url            = 'https://tomeko.net/software/JSONedit/bin/JSONedit_0_9_40.zip'
$validExitCodes = @(0)
$exeName        = "jsonedit.exe"
$checksum       = '5b63311ad33024fb679e09fecec01aa580fcda492e85e5998e590d0ca4573ec4'
$checksumType   = 'sha256'

Install-ChocolateyZipPackage "$packageName" "$url" "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" -checksum $checksum -checksumType $checksumType

$AppPathKey = "Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\$exeName"
If (!(Test-Path $AppPathKey)) {New-Item "$AppPathKey" | Out-Null}
Set-ItemProperty -Path $AppPathKey -Name "(Default)" -Value "$env:chocolateyinstall\lib\$packagename\tools\$exeName"
Set-ItemProperty -Path $AppPathKey -Name "Path" -Value "$env:chocolateyinstall\lib\$packagename\tools\"
