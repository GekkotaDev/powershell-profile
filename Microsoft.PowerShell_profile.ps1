using namespace System.Management.Automation
using namespace System.Management.Automation.Language


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
(Split-Path "$PROFILE") + "\Autocomplete" | Get-ChildItem | Import-Module

# Aliases
Set-Alias -Name which -Value Get-Command
Set-Alias -Name fzgrep -Value Invoke-PsFzfRipgrep
Set-Alias -Name git-status -Value Invoke-FuzzyGitStatus
Set-Alias -Name scoop.sh -Value Invoke-FuzzyScoop

# Initialize shell integrations.
Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })
