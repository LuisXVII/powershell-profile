# ---------------------------------------------------------------------------
# Install required modules
# You will need to run in an administrator PowerShell window
# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
# ---------------------------------------------------------------------------

# PSReadLine
echo "Installing PSReadLine..."
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser

# Posh Git
echo "Installing Posh Git..."
Install-Module -Name posh-git -Scope CurrentUser

# PSColor
echo "Installing PSColor..."
Install-Module -Name PSColor -Scope CurrentUser

# Oh My Posh
echo "Installing Oh My Posh..."
Install-Module -Name oh-my-posh -Scope CurrentUser

# PSFzf
# fzf is a fuzzy file finder, and will provide fuzzy location searching
# when using Ctrl+T, and will provide better reverse command searching via
# Ctrl-R.
echo "Installing PSFzf..."
Install-Module -Name PSFzf -Scope CurrentUser
# choco install fzf # TODO: install chocolatey for automatically installing fzf and add it to PATH
echo "NOTE: Download fzf from GitHub and extract the exe to a folder you want, then add that folder to PATH. https://github.com/junegunn/fzf/releases"

# Copy profile.ps1 into the location of $profile variable
echo "Copying profile.ps1 into location of profile variable in $profile"

Copy-Item profile.ps1 $profile

echo "Your profile has a chosen theme already in profile.ps1, but you can choose a different prompt style with function 'Get-PoshThemes'"

echo "All done! Please reopen your PowerShell window."