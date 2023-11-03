Clear-Host

## version check
if($PSVersionTable.PSVersion.Major -ne 7){
    Write-Host "ERROR: You are using a old version of PowerShell! (Required: 7.x)" -ForegroundColor Red
    Pause
    Clear-Host
    Exit
}
Else{
    Write-Host "Version OK" -ForegroundColor Green
}
 
Write-Host "GB calculation is currently not working" -ForegroundColor Yellow
[int]$IdNumber = Read-host -Prompt "Welk disk ID wilt u bekijken?"
$SizeUnit = Read-host -Prompt "In welke eenheid wilt u dit hebben? (TB, GB, MB, KB)"


Function Get-Mydisk(){
    #Get-Disk -Number $IdNumber
    [CmdletBinding()]
    Param(
        $id,
        $unit
    )

    $disk = Get-Disk
    $diskSize = $disk[$IdNumber]

    Switch($SizeUnit){
        "KB" {$diskcalc = $diskSize.Size /1024}
        "MB" {$diskcalc = $diskSize.Size /1024/1024}
        "GB" {$diskcalc = $diskzise.Size /1024/1024/1024}
        "TB" {$diskcalc = $diskSize.Size /1024/1024/1024/1024}
        Default {$diskcalc = $diskSize.Size}
    }
    
    Write-Host "Disk" $IdNumber "is" $diskcalc $SizeUnit -ForegroundColor Yellow
}

Get-Mydisk 
Pause


Clear-Host