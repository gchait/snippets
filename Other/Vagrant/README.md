## Fedora on (Windows, VirtualBox, Vagrant) Setup

- Run these commands in the PowerShell window from before:
  ```
  cd .\Vagrant
  v up
  mkdir $HOME\.ssh -Force
  [IO.File]::WriteAllLines("$HOME\.ssh\vagrant", (v ssh-config))
  ```

- Add `Include vagrant` as the first line of `$HOME\.ssh\config` (create it if it doesn't exist).

- Open VSCodium and use Remote Explorer to open `default` at `~/Projects`.

- Open WezTerm. It should already launch into the VM using SSH.

- If VSCodium extensions are not automatically installed into the VM, run this inside it:
  ```
  pkill -f vscodium-server
  ```

- Save a new GitHub SSH key [here](https://github.com/settings/keys):
  ```
  cat ~/.ssh/id_rsa.pub
  ```
