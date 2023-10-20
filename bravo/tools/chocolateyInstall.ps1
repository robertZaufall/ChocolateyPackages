$ErrorActionPreference = 'Stop';

$packageArgs = @{
	packageName    = 'bravo'
	url            = 'https://github.com/sql-bi/Bravo/releases/download/v1.0.6/Bravo.1.0.6.x64.msi'
	fileType       = 'msi'
	silentArgs     = '/quiet /norestart'
    checksum       = '716ee48af1c76c18d855d3b55ed3532cd013541c023ca10dddcf3a95fa7e4002'
    checksumType   = 'sha256'
	validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
