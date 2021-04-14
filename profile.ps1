# ---------------------------------------------------------------------------
# Settings
# ---------------------------------------------------------------------------
$MaximumHistoryCount = 512
$FormatEnumerationLimit = 100
$RepoPath = "D:\MS\code"
$PersonalRepoPath = "D:\personal\code"

# ---------------------------------------------------------------------------
# Modules
# ---------------------------------------------------------------------------

# PSReadline provides Bash like keyboard cursor handling
if ($host.Name -eq 'ConsoleHost')
{
	Import-Module PSReadline

	Set-PSReadLineOption -MaximumHistoryCount 4000
	Set-PSReadlineOption -ShowToolTips:$true

	# With these bindings, up arrow/down arrow will work like
	# PowerShell/cmd if the current command line is blank. If you've
	# entered some text though, it will search the history for commands
	# that start with the currently entered text.
	Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
	Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

	Set-PSReadlineKeyHandler -Key "Tab" -Function "MenuComplete"
	Set-PSReadlineKeyHandler -Chord 'Shift+Tab' -Function "Complete"
}

# fzf is a fuzzy file finder, and will provide fuzzy location searching
# when using Ctrl+T, and will provide better reverse command searching via
# Ctrl-R.
Import-Module PSFzf -ArgumentList 'Ctrl+T','Ctrl+R'

# Git support
# The Oh My Posh profile already includes git status information from Posh-Git.
# However, not all themes display all the information, so you can uncomment the next line to enable Posh-Git on every theme.
# Note that it might end up duplicating the git info.
#Import-Module Posh-Git

# Colorize directory output
Import-Module PSColor

# Enable Oh My Posh for prompt customization
Import-Module oh-my-posh

# Set Oh My Posh theme
Set-PoshPrompt -Theme ys

# ---------------------------------------------------------------------------
# Custom Aliases
# ---------------------------------------------------------------------------
set-alias unset      remove-variable
set-alias set        set-variable
set-alias eval       invoke-expression
set-alias vi         vim.exe

# ---------------------------------------------------------------------------
# Helper functions
# ---------------------------------------------------------------------------

# starts a new execution scope
function Start-NewScope
{
	param($Prompt = $null) Write-Host "Starting New Scope"
	if ($Prompt -ne $null)
	{
		if ($Prompt -is [ScriptBlock])
		{
			$null = New-Item function:Prompt -Value $Prompt -force
		}
		else
		{
			function Prompt {"$Prompt"}
		}
	}
	$host.EnterNestedPrompt()
}

function reboot
{
	shutdown /r /t 1
}

function repo($project)
{
	cd "$RepoPath\$project"
}

function personalRepo($project)
{
	cd "$PersonalRepoPath\$project"
}

function repos()
{
    cd $RepoPath
}

function personalRepos()
{
    cd $PersonalRepoPath
}