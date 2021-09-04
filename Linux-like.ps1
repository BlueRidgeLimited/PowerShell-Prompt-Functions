function prompt {
    $CurrentUser = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent())
    $IsAdmin = $CurrentUser.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
    if ($IsAdmin -eq "True") {
        $AdminStatus = "Admin"
        $Color = 'Yellow'
    }
    elseif ($IsAdmin -eq "False") {
        $AdminStatus = "User"
        $Color = 'Green'
    }
    $Elevation = "[" + "$AdminStatus" + "]: "
    $UserString = "$env:USERNAME" + "@" + "$env:COMPUTERNAME"
    $PromptPath = " ~ " + "\" + (Split-Path $Pwd -Leaf)
    Write-Host "PS: " -ForegroundColor Cyan -NoNewline
    Write-Host "$Elevation" -ForegroundColor $Color -NoNewline
    Write-Host "$UserString" -ForegroundColor White -NoNewline
    Write-Host ":" -NoNewline
    Write-Host "$PromptPath" -ForegroundColor DarkGreen -NoNewline
    return " $ "
}