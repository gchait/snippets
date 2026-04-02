## GRUB-based

- ```powershell
  Set-VMVideo -VMName "rocky" -HorizontalResolution 2560 -VerticalResolution 1440 -ResolutionType Single
  ```

- Add to `GRUB_CMDLINE_LINUX`:
  ```
  video=Virtual-1:2560x1440@60
  ```

- Update GRUB

- Reboot

## PopOS

- Enable all services and guest stuff

- ```powershell
  Set-VMVideo -VMName "popos" -HorizontalResolution 2560 -VerticalResolution 1440 -ResolutionType Single
  ```

- Generate a modeline:
  ```shell
  cvt 2560 1440 60
  ```

- Put the result in `~/.xprofile`:
  ```shell
  #!/bin/sh
  xrandr --newmode "2560x1440_60.00"  312.25  2560 2752 3024 3488  1440 1443 1448 1493 -hsync +vsync
  xrandr --addmode Virtual-1 "2560x1440_60.00"
  ```

- Run those 2 commands just in case

- ```shell
  sudo kernelstub -a video=hyperv_fb:2560x1440
  ```

- Reboot
