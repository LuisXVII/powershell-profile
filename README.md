# powershell-profile
My personal powershell profile. Includes a setup script for first-time setup.
Based on Donovan Lange's profile https://github.com/donovanlange/WindowsPowerShell/blob/master/Profile.ps1

## How to install
1. Download this package
1. First time only: Open `fonts` folder and install `CodeNewRoman NF` from there. It will be used for icons in the terminal
1. Open `profile.ps1` and modify the variables `WorkRepoPath` and `PersonalRepoPath` to your own folders
1. Open a PowerShell window with elevated administrator privileges, then run. This is to enable execution of the downloaded modules from the PowerShell Gallery
   ```ps1
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```
1. Open another PowerShell window (without admin privileges) in this folder, then run `setup.ps1`
1. Follow the installation prompts for each module
1. Download fzf from GitHub and extract the exe to a folder you want, then add that folder to PATH. https://github.com/junegunn/fzf/releases
   * Alternatively, you can run `choco install fzf` if you have chocolately installed
1. Close all PowerShell windows and reopen. Voila!


## Font
* Font chosen is `CodeNewRoman NF`
* Downloaded from [Nerd Fonts](https://www.nerdfonts.com/#home) GitHub Repo: https://github.com/ryanoasis/nerd-fonts
* You can choose a different font from the [Nerd Fonts download page](https://www.nerdfonts.com/font-downloads). Then choose the new one in the terminal settings.
  * If your chosen font is not available in the terminal options, you must add the font into the registry as a valid terminal font for windows. Use the following snippet in an administrator PowerShell window
  ```ps1
  # ---------------------------------------------------------------------------
  # Add font as a possible font for terminal
  # Taken from https://gist.github.com/markwragg/6301bfcd56ce86c3de2bd7e2f09a8839
  # ---------------------------------------------------------------------------
  # Font name can be obtained from the font installation window after downloading
  $font = "CodeNewRoman NF" # Choose a mono font variant for console
  echo "Registering font $font in registry for it to be selectable from terminal options..."
  $key = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Console\TrueTypeFont'
  Set-ItemProperty -Path $key -Name '0000' -Value $font
  echo "Registered! Now open your terminal options and choose $font as your used font for"
  ```