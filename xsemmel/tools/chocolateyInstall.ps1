$packageName  = 'xsemmel'
$toolsPath    = Split-Path $MyInvocation.MyCommand.Definition
$fileFullPath = "$toolsPath\xsemmel-portable_2017-04-09.zip"
$destination  = Join-Path ${env:ProgramFiles(x86)} 'Xsemmel'

$packageArgs = @{
  packageName            = $packageName
  filefullpath           = $fileFullPath
  destination            = $destination
}

Get-ChocolateyUnzip @packageArgs

$destinationLink = Join-Path 'C:\Users\Public\Desktop' 'Xsemmel.lnk'
$destinationExe  = Join-Path $destination 'Xsemmel.exe'
Install-ChocolateyShortcut -ShortcutFilePath $destinationLink -TargetPath $destinationExe
