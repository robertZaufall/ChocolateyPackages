$ErrorActionPreference = 'Stop';

$packageArgs = @{
	packageName    = 'wasmedge'
	url            = 'https://github.com/WasmEdge/WasmEdge/releases/download/0.13.4/WasmEdge-0.13.4-windows.msi'
	fileType       = 'msi'
	silentArgs     = '/quiet /norestart'
    checksum       = 'bd9db77d9ac8f1a2d612b817de4f331a1edc2f3ded911441a0feadd59bf66683'
    checksumType   = 'sha256'
	validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs