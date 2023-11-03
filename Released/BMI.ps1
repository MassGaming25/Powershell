# FileName: BMI.ps1
# Author: Brian van der Schaaf
# Desc: calculates BMI
# Version: STABILE

Clear-Host

[string]$Name = Read-Host -prompt "What is yout name?"
[int]$Age = Read-Host -Prompt "How old are you?"
[float]$weight = Read-Host -Prompt "What is your weight in kilograms?"
[float]$height = Read-host -Prompt "What is your height in meters?"


Write-Host "      "
Write-Host "Hello, $name"
Write-Host "=====Results====="  -ForegroundColor Cyan
Write-Host "You are $age years old." -ForegroundColor Cyan
Write-Host "You weigh $weight KG." -ForegroundColor Cyan
Write-Host "You are $height Meters tall." -ForegroundColor Cyan

# AgeCheck: Not younger than 19 and not older than 69
if($Age -lt 19){
    Write-Host "ERROR: You are too young to obtain BMI advice." -ForegroundColor Red
    
    Exit
}
If($Age -gt 69){
    Write-Host "ERROR: You are too old to obtain BMI advice." -ForegroundColor Red

    Exit
}

#Get-BMI function to calculate BMI
Function Get-BMI(){
    Param(
        $Age,
        $weight,
        $height
    )

    return $weight / ($height*$height)
}

$BMI = Get-BMI $Age $weight $height
Write-Host "Your BMI score is $BMI." -ForegroundColor DarkCyan

Write-Host  "     "
Write-Host "=====Advice=====" -ForegroundColor Gray
If($BMI -lt 18.5){
    Write-Host "You are underweight." -ForegroundColor Yellow
    Write-Host "Advice: Eat more nutritional foods." -ForegroundColor Yellow
}
ElseIf($BMI -ge 18.5 -and $BMI -lt 25){
    Write-Host "You currently have a healthy weight." -ForegroundColor Green
    Write-Host "Advice: Keep it up :)" -ForegroundColor Green
}
ElseIf($BMI -ge 25 -and $BMI -lt 30){
    Write-host "You are overweight." -ForegroundColor Red
    Write-Host "Advice: Change your diet, please contact your doctor for assistance." -ForegroundColor Red
}
ElseIf($BMI -gt 30){
    Write-Host "You are Obese." -ForegroundColor DarkRed
    Write-Host "Contact your doctor as soon as possible." -ForegroundColor DarkRed
    Write-Host "Your condition might cause medical problems in the future." -ForegroundColor DarkRed
}

Pause

Clear-Host