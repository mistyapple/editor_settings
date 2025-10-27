Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineKeyHandler -Key Ctrl+j -Function AcceptSuggestion
Set-PSReadLineKeyHandler -Key Ctrl+k -Function AcceptNextSuggestionWord

Set-PSReadLineKeyHandler -Key Ctrl+p -Function ForwardWord
Set-PSReadLineKeyHandler -Key Ctrl+o -Function BackwardWord

Set-PSReadLineKeyHandler -Key Ctrl+u -Function DeleteLine

function Vsim-View {vsim -view vsim.wlf}
New-Alias -Name wlf -Value Vsim-View

function Update_Powershell {winget install --id Microsoft.Powershell --source winget}
New-Alias -Name upsh -Value Update_Powershell

function Exit_function {exit}
New-Alias -Name ee -Value Exit_function

function Go_Back_Dir {cd ..}
New-Alias -Name cc -Value Go_Back_Dir

function Git_Status {git status}
New-Alias -Name gts -Value Git_Status

function Git_Status_uno {git status -uno}
New-Alias -Name gtsu -Value Git_Status_uno

function Git_Branch_list {git branch -avv}
New-Alias -Name gtbl -Value Git_Branch_list

function Git_Stash {git stash}
New-Alias -Name gtsh -Value Git_Stash

function Git_Stash_Pop {git stash pop}
New-Alias -Name gtsp -Value Git_Stash_Pop

$PSStyle.FileInfo.Directory = "`e[95m"

# Commands are green
Set-PSReadLineOption -Colors @{ Command = 'Green' 
                                Comment = "`e[90m" }

function prompt {
  $currentDirectory = Get-Location
  #"`r`n`e[34m$currentDirectory`r`n`e[33m❯ "
  
  # make output white instead of yellow
  "`r`n`e[34m$currentDirectory`r`n`e[33m❯`e[37m "
}

# Invoke-Expression (&starship init powershell)



