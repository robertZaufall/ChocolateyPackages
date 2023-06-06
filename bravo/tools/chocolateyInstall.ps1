$ErrorActionPreference = 'Stop';

$packageArgs = @{
	packageName    = 'bravo'
	url            = 'https://github.com/sql-bi/Bravo/releases/download/v1.0.2/Bravo.1.0.2.x64.msi'
	fileType       = 'msi'
	silentArgs     = '/quiet /norestart'
    checksum       = '59ada0ae11ec50a309c56579cdf2602324063bde81c89e50c92c263942a38913'
    checksumType   = 'sha256'
	validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
