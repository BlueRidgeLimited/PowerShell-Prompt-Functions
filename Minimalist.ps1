function Global:Prompt {
    $Identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $Principal = [Security.Principal.WindowsPrincipal] $Identity
    $AdminLevel = [Security.Principal.WindowsBuiltInRole]::Administrator

    $(if (Test-Path variable:/PSDebugContext) { '[DEBUG]: ' }
        elseif ($Principal.IsInRole($AdminLevel)) { '[ADMIN]: ' }
        else { '' }
    ) + 'PS ' + $(Get-Location) +
    $(if ($NestedPromptLevel -ge 1) { '>>' }) + '> '
}