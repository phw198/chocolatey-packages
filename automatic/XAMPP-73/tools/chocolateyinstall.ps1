﻿$ErrorActionPreference = 'Stop';
$checksum = '1ae7459ab97993a57d7923628695ba881d0e72403084f918cdf60d30eb56a8dd'
$url = 'https://sourceforge.net/projects/xampp/files/XAMPP%20Windows/7.3.25/xampp-windows-x64-7.3.25-0-VC15-installer.exe'

$packageArgs = @{
  packageName    = 'XAMPP-73'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = $url
  silentArgs     = "--mode unattended"
  validExitCodes = @(0, 3010, 1641)
  softwareName   = 'xampp*'
  checksum       = $checksum
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs