﻿$ErrorActionPreference = 'Stop';
$checksum = '75739ca5639d7eb313bbd53ff88b7a5911ab8c7eed1d47e5747f021e6e462340'
$url = 'https://sourceforge.net/projects/xampp/files/XAMPP%20Windows/7.3.30/xampp-windows-x64-7.3.30-0-VC15-installer.exe'

$packageArgs = @{
  packageName    = 'XAMPP-73'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = $url
  silentArgs     = "--mode unattended --launchapps 0"
  validExitCodes = @(0, 3010, 1641)
  softwareName   = 'xampp*'
  checksum       = $checksum
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
