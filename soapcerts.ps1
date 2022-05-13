[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$url = $args[0]
$mypath = $PSScriptRoot + "\"
$webRequest = [Net.WebRequest]::Create($url)
$webRequest.GetResponse()
$cert = $webRequest.ServicePoint.Certificate
$chain = New-Object -TypeName System.Security.Cryptography.X509Certificates.X509Chain
$chain.build($cert)
$chain.ChainElements.Certificate | % {set-content -value $($_.Export([Security.Cryptography.X509Certificates.X509ContentType]::Cert)) -encoding byte -path "$mypath$($_.Thumbprint).cer"}


Get-ChildItem "C:\users\ic_admin\Desktop\certs" -Filter *.cer | ForEach-Object {
    $cername = $_.BaseName + ".cer"
    $pemname = $_.BaseName + ".pem"
    D:\I3\IC\Server\ssl_app-w32r-21-2.exe x509 -inform der -in $cername -out $pemname -trustout
    $zeroname = D:\I3\IC\Server\ssl_app-w32r-21-2.exe x509 -in $pemname -hash -noout
    $pathname = $mypath + $pemname
    $newname = $mypath + $zeroname + ".0"
    Rename-Item -Path $pathname -NewName $newname
    $oldfile = $mypath + $cername
    Remove-Item $oldfile
}
