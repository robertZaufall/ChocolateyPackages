$packageName  = 'chocolatestore'
$toolsPath    = Split-Path $MyInvocation.MyCommand.Definition
$fileFullPath = "$toolsPath\ChocolateStoreCore.1.0.4.zip"
$destination  = Join-Path ${env:ProgramFiles(x86)} 'ChocolateStore'
$exeName      = 'ChocolateStoreCore.exe'

$packageArgs = @{
  packageName            = $packageName
  filefullpath           = $fileFullPath
  destination            = $destination
}

Get-ChocolateyUnzip @packageArgs

$destinationLink   = Join-Path 'C:\Users\Public\Desktop' 'ChocolateStore.lnk'
Install-ChocolateyShortcut -ShortcutFilePath $destinationLink -TargetPath $destination

$AppPathKey = "Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\$exeName"
If (!(Test-Path $AppPathKey)) {New-Item "$AppPathKey" | Out-Null}
Set-ItemProperty -Path $AppPathKey -Name "(Default)" -Value "$env:chocolateyinstall\lib\$packageName\tools\$exeName"
Set-ItemProperty -Path $AppPathKey -Name "Path" -Value "$env:chocolateyinstall\lib\$packageName\tools\"
