Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineKeyHandler -Key Ctrl+j -Function AcceptSuggestion
Set-PSReadLineKeyHandler -Key Ctrl+k -Function AcceptNextSuggestionWord 

function Vsim-View {vsim -view vsim.wlf}
New-Alias -Name wlf -Value Vsim-View

function Update_Powershell {winget install --id Microsoft.Powershell --source winget}
New-Alias -Name upsh -Value Update_Powershell

$PSStyle.FileInfo.Directory = "`e[95m"

# first word in PS is green
Set-PSReadLineOption -Colors @{ Command = 'Green' }

function Go_Back_Dir {cd ..}
New-Alias -Name cc -Value Go_Back_Dir

#function prompt {
#   $currentDirectory = Get-Location
#   "`r`n`e[34m$currentDirectory`r`n`e[33m❯ "
#}

Invoke-Expression (&starship init powershell)

