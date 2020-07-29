﻿$ErrorActionPreference = 'Stop'
import-module au

$download_page_url = 'https://www.apachefriends.org/blog.html'
$url_part1 = 'https://www.apachefriends.org/xampp-files/'
$url_part2 = '/xampp-windows-x64-'
$url_part3 = '-VC15-installer.exe'

function global:au_SearchReplace {
    @{
        'tools\ChocolateyInstall.ps1' = @{
            "(^[$]checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(^[$]url\s*=\s*)('.*')"   = "`$1'$($Latest.Url)'"
        }
     }
}

function global:au_GetLatest {
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls, [Net.SecurityProtocolType]::Tls11, [Net.SecurityProtocolType]::Tls12, [Net.SecurityProtocolType]::Ssl3
	[Net.ServicePointManager]::SecurityProtocol = "Tls, Tls11, Tls12, Ssl3"
	$homepage_content = Invoke-WebRequest -UseBasicParsing -Uri $download_page_url

     # Get Version
    $homepage_content -match '\d{1}\.4\.\d{1,2}\-0'| Out-Null
    $real_version = $matches[0]
	$version = $real_version -replace "-0", ""
	$url = $url_part1 + $version + $url_part2 + $real_version + $url_part3
    

    $Latest = @{ URL = $url; Version = $version }
    return $Latest
}

update -NoCheckChocoVersion
