using namespace System.Management.Automation
using namespace System.Management.Automation.Language

$ProfileRoot = Split-Path $PROFILE

Get-ChildItem "$ProfileRoot\Commands" | Import-Module


Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'


# Do not save to history commands prefixed with space.
Set-PSReadLineOption -AddToHistoryHandler {
    param($command)

    if ($command -like ' *') {
        return $false
    }

    return $true
} 

# Set key handlers.
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Load autocompletion scripts
Get-ChildItem "$ProfileRoot\Autocomplete" | Import-Module

# Aliases
Set-Alias -Name which -Value Get-Command
Set-Alias -Name fzgrep -Value Invoke-PsFzfRipgrep
Set-Alias -Name git-status -Value Invoke-FuzzyGitStatus
Set-Alias -Name scoop.sh -Value Invoke-FuzzyScoop
Set-Alias -Name ls -Value Invoke-Eza
Set-Alias -Name lg -Value lazygit

# Initialize shell integrations.
Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })
