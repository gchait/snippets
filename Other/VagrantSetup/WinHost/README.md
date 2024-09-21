## Windows Host Setup

- Install these programs manually, if needed:
  - [Firefox](https://www.mozilla.org/en-US/firefox/new/)
  - [WhatsApp](https://www.whatsapp.com/download)
  - [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
  - [Lightshot](https://app.prntscr.com/en/index.html)
  - [Google Drive](https://www.google.com/drive/download/)
  - [Discord](https://discord.com/download)
  - [Steam](https://store.steampowered.com/about/)

- Run these commands in PowerShell, one by one:
  ```
  Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
  iwr -useb get.scoop.sh | iex
  
  scoop install git
  git config --global core.autocrlf false
  
  git clone https://github.com/gchait/gchait.git
  cd .\gchait
  
  Copy-Item -Path .\WinHost\Home\* -Destination $HOME -Recurse -Force
  Copy-Item -Path .\WinHost\settings.json -Destination $HOME\scoop\apps\vscodium\current\data\user-data\User -Force
  
  .\WinHost\scoop-pkgs.ps1
  ```

- To have the VM launch on host startup, run this too:
  ```
  Copy-Item -Path .\WinHost\call-start-vm.cmd -Destination "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup" -Force
  ```

- Install the fonts from [here](../Fonts).

- Set some wallpapers. There are some nice ones [here](../Wallpapers).

- Continue to launching your Fedora instance [here](../Vagrant/README.md).
