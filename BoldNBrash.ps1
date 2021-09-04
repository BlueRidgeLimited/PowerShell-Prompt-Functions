function Prompt {
    $Identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $Principal = [Security.Principal.WindowsPrincipal] $Identity
    $AdminLevel = [Security.Principal.WindowsBuiltInRole]::Administrator
    $AdminCheck = $Principal.IsInRole($AdminLevel)
    if ($AdminCheck -eq "True") {
        $Status = "[ADMIN]"
        $StatusColor = 'Yellow'
    }
    elseif ($AdminCheck -eq "False") {
        $Status = "[USER]"
        $StatusColor = 'Gray'
    }

    $User = $env:USERNAME
    $Computer = $env:COMPUTERNAME

    $History = @(Get-History)
    if ($History.Count -gt 0) {
        $LastItem = $History[$History.Count - 1]
        $LastId = $LastItem.Id
    }
    $NextCommand = $LastId + 1
    $CurrentDir = Split-Path $Pwd -leaf
 
    Write-Host "$Status" -ForegroundColor $StatusColor -NoNewline
    Write-Host ":" -NoNewline
    Write-Host "[$User]" -ForegroundColor Cyan -NoNewline
    Write-Host "|" -ForegroundColor White -NoNewline 
    Write-Host "[$Computer] " -ForegroundColor Magenta -NoNewline
    Write-Host ".\$CurrentDir" -ForegroundColor Gray -NoNewline
    Write-Host " : [$NextCommand]" -ForegroundColor Green -NoNewline
    return " >> " 
    
}