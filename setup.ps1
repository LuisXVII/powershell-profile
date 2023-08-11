# ---------------------------------------------------------------------------
# Install required modules
# You will need to run in an administrator PowerShell window
# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
# ---------------------------------------------------------------------------

# Setting PowerShell Gallery as a trusted repository
echo "Setting PowerShell Gallery as a trusted repository"
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

# PSReadLine
echo "Installing PSReadLine..."
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser

# Posh Git
echo "Installing Posh Git..."
Install-Module -Name posh-git -Scope CurrentUser

# Oh My Posh
echo "Installing Oh My Posh..."
winget install JanDeDobbeleer.OhMyPosh -s winget

# Terminal Icons
echo "Installing Terminal Icons..."
Install-Module -Name Terminal-Icons -Scope CurrentUser

# Tree
# Tree will display recursively the file contents from where you are and below and pretty print them
echo "Installing Tree..."
Install-Module -Name Tree -Scope CurrentUser

# PSFzf
# fzf is a fuzzy file finder, and will provide fuzzy location searching
# when using Ctrl+T, and will provide better reverse command searching via
# Ctrl-R.
echo "Installing PSFzf..."
Install-Module -Name PSFzf -Scope CurrentUser

# Copy profile.ps1 into the location of $profile variable. $profile is a read-only variable, so the solution is to copy the profile script into the location of $profile instead
echo "Copying profile.ps1 into location of profile variable in $profile"

Copy-Item profile.ps1 $profile

echo "Your profile has a chosen theme already in profile.ps1, but you can choose a different prompt style with function 'Get-PoshThemes'"

echo "If you need to update the profile, update profile.ps1 here and then rerun this script."

echo "All done! Please reopen your PowerShell window."
