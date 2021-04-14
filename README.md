# powershell-profile
My personal powershell profile. Includes a setup script for first-time setup.

## How to install
1. Download this package
2. Open `profile.ps1` and modify the variables `WorkRepoPath` and `PersonalRepoPath` to your own folders
3. Open a PowerShell window with elevated administrator privileges, then run. This is to enable execution of the downloaded modules from the PowerShell Gallery
```ps1
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```
4. Open another PowerShell window (without admin privileges) in this folder, then run `setup.ps1`
5. Follow the installation prompts for each module
6. Download fzf from GitHub and extract the exe to a folder you want, then add that folder to PATH. https://github.com/junegunn/fzf/releases
7. Close all PowerShell windows and reopen. Voila!
