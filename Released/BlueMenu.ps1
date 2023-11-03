### ScriptName: BlueMenu.ps1
### Version: REL 1.0
### Author: Brian van der Schaaf
### Req. PS version: 7.x.x
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

While($true){
    Write-Host "+------------BlueMenu-------------+" -ForegroundColor Cyan
    Write-Host "| 1: Show date/time               |" -ForegroundColor Cyan
    Write-Host "| 2: Show stopped services        |" -ForegroundColor Cyan
    Write-Host "| 3: Show hard Disks              |" -ForegroundColor Cyan
    Write-Host "| 4: Show offline networkadapters |" -ForegroundColor Cyan
    Write-host "| 5: Quit BlueMenu                |" -ForegroundColor Cyan
    Write-Host "+----------Version: 1.0-----------+" -ForegroundColor Cyan
    [int]$antwoord = Read-Host -Prompt "Please input your command." -ErrorAction SilentlyContinue

    if($antwoord -eq 1){
        Break 
    }
    Elseif($antwoord -eq 2){
        Break
    }
    Elseif($antwoord -eq 3){
        Break
    }
    Elseif($antwoord -eq 4){
        Break
    }
    Elseif($antwoord -eq 5){
        Write-Host "Goodbye" -ForegroundColor DarkGreen
        Exit
    }
}

Switch($antwoord){
    1 {
        Write-Host "This is your current time and date. (Displayed in your systems language)" -ForegroundColor Green
        Get-Date

        Pause
        Clear-Host
    }
    
    2 {
        Write-Host "Displaying Downed services now." -ForegroundColor Green
        $services = Get-Service -Verbose -ErrorAction SilentlyContinue 

        foreach($service in $services){
            if($services.status -eq "Stopped"){
                Write-host $service.Name $service.StartupType -ForegroundColor Red

                
            }
        }
    
        $antwoord2 = Read-Host -Prompt "Would you like to start these services? (y/n)"

            if($antwoord2 -eq "y"){
                Write-host "Attempting to start services. If this does not work, please enable manually." -ForegroundColor Yellow
                Start-Service $service.Name
                Write-Host "Done" -ForegroundColor DarkGreen
            }
            Elseif($antwoord2 -eq "n"){
                Exit
            }
    
        Pause
        Clear-Host
    }
    3 {
        $disk = Get-Disk
        $diskSize = $disk[0].Size / 1000000
        $diskSize1 = $disk[1].size /1000000
        $diskSize2 = $disk[2].size / 1000000
        $diskSize3 = $disk[3].size /1000000
        $diskSize4 = $disk[4].size /1000000
        $diskSize5 = $disk[5].Size /1000000
        
        Write-Host "Disk 0: "$diskSize "MB" -ForegroundColor Yellow
        Write-Host "Disk 1: "$diskSize1 "MB" -ForegroundColor Yellow
        Write-Host "Disk 2: "$diskSize2 "MB" -ForegroundColor Yellow
        Write-Host "Disk 3: "$diskSize3 "MB" -ForegroundColor Yellow
        Write-host "Disk 4: "$diskSize4 "MB" -ForegroundColor Yellow
        Write-Host "Disk 5: "$diskSize5 "MB" -ForegroundColor Yellow

        Pause
        Clear-Host
    }
    4{
        Write-Host "Showing offline network adapters..." -ForegroundColor Yellow
        $network = Get-NetAdapter

        foreach($net in $network){
            if($net.Status -eq "Disconnected"){
                Write-Host $net.Name $net.Status -ForegroundColor Red
            }
        }
    }

    
}