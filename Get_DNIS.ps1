$ErrorActionPreference= 'silentlycontinue'

$primaryic = $args[0]
$env = Get-ChildItem -path "HKLM:\SOFTWARE\Wow6432Node\Interactive Intelligence\EIC\Directory Services\Root"
$attprofiles = Get-ChildItem -path Registry::$($env.Name)"\Production\$($primaryic)\AttendantData\Attendant"

foreach ($profile in $attprofiles){
    try{
        $dnisobj = Get-ItemProperty -path Registry::$($profile.Name) -Name DNISString | Select-Object DNISString
        $dnis = $dnisobj.psobject.Properties.value.split(",")
        $nameobj = Get-ItemProperty -path Registry::$($profile.Name) -Name Name | Select-Object Name
        $name = $nameobj.psobject.Properties.value
    } 
    catch [InvalidArgument, InvalidOperation] {
        $dnis = @()
    }
    

    if ($dnis.Length -ge 1){
        foreach ($d in $dnis){
            "$($d),$($name)" | Out-File -Append DNIS.txt
        }
    }
}
