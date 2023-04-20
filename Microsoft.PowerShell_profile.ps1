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
