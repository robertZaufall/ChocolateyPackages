$packageName    = 'jsonedit'
$url            = 'https://tomeko.net/software/JSONedit/bin/JSONedit_0_9_41.zip'
$validExitCodes = @(0)
$exeName        = "jsonedit.exe"
$checksum       = '16b6dfcf846900182d2519e9186d0e121a842599372127af15be197e2e289b0d'
$checksumType   = 'sha256'

Install-ChocolateyZipPackage "$packageName" "$url" "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" -checksum $checksum -checksumType $checksumType

$AppPathKey = "Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\$exeName"
If (!(Test-Path $AppPathKey)) {New-Item "$AppPathKey" | Out-Null}
Set-ItemProperty -Path $AppPathKey -Name "(Default)" -Value "$env:chocolateyinstall\lib\$packagename\tools\$exeName"
Set-ItemProperty -Path $AppPathKey -Name "Path" -Value "$env:chocolateyinstall\lib\$packagename\tools\"
