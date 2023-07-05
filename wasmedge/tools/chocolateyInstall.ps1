$ErrorActionPreference = 'Stop';

$packageArgs = @{
	packageName    = 'wasmedge'
	url            = 'https://github.com/WasmEdge/WasmEdge/releases/download/0.13.0/WasmEdge-0.13.0-windows.msi'
	fileType       = 'msi'
	silentArgs     = '/quiet /norestart'
    checksum       = '25637dc88f088b840bb23d37e1fb87eaf27ac35a0866da9a4339b3957d3912e9'
    checksumType   = 'sha256'
	validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs