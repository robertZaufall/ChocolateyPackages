$packageName  = 'xsddiagram'
$toolsPath    = Split-Path $MyInvocation.MyCommand.Definition
$fileFullPath = Join-Path $toolsPath 'XSDDiagram.zip'
$destination  = Join-Path ${env:ProgramFiles(x86)} 'XSDDiagram'

$packageArgs = @{
  packageName            = $packageName
  filefullpath           = $fileFullPath
  destination            = $destination
}

Get-ChocolateyUnzip @packageArgs

$destinationLink = Join-Path 'C:\Users\Public\Desktop' 'XSDDiagram.lnk'
$destinationExe  = Join-Path $destination 'XSDDiagram.exe'
Install-ChocolateyShortcut -ShortcutFilePath $destinationLink -TargetPath $destinationExe
