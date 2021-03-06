# My GNU/Linux dotfiles

<br>

<img src="/.scrot.symlink/tux.jpg" data-canonical-src="https://github.com/bvanhai/dotfiles" width="512" height="192" />

:penguin: This is a collection of **dotfiles** for use with **BSPWM** or any other **window manager** that requires the use of a **dzen panel**.
<br>
:penguin: It is **my personal configuration** and includes all of the features I find necessary for a full WM experience.
<br>
:penguin: My `.vim` folder is [here](https://github.com/bvanhai/.vim) and `My GNU/Linux cheat-sheet` is [here](https://github.com/bvanhai/dotfiles/blob/master/doc/My-GNU-Linux-cheat-sheet.txt).
<br>

## Table of Contents

- [Screenshots](#screenshots)
- [Requirements](#requirements)
    - [General](#general)
    - [Panel](#panel)
    - [Other useful programs](#other-useful-programs)
- [Installation](#installation)
    - [General](#general)
        - [Suspend Service](#suspend-service)
        - [GTK Themes](#gtk-themes)
        - [Font](#font)
    - [Configuration](#configuration)
        - [Panel](#panel)
        - [Keybinds](#keybinds)
        - [Touchpad Synaptics](#touchpad-synaptics)
        - [Background](#background)
        - [Auto Suspend](#auto-suspend)
        - [xinitrc](#xinitrc)
        - [Fontconfig Configuration](#fontconfig-configuration)
- [Kernel Configuration](#kernel-configuration)
- [Document](#document)
- [Credits](#credits)

***********

<br>

## Screenshots

### Version 5: 2017-08-27

<br>

![Version5](/.scrot.symlink/v5a.png)
![Version5](/.scrot.symlink/v5b.png)

<br>

### Version 4: 2017-04-22

<br>

![Version4a](/.scrot.symlink/v4a.png)
![Version4b](/.scrot.symlink/v4b.png)
![Version4c](/.scrot.symlink/v4c.png)

<br>

### Version 3: 2016-01-11

<br>

![Version3a](/.scrot.symlink/v3a.png)
![Version3b](/.scrot.symlink/v3b.png)
![Version3c](/.scrot.symlink/v3c.png)

<br>

### Version 2: 2014-12-26

<br>

![Version2](/.scrot.symlink/v2.png)

<br>

### Version 1: 2014-09-07

<br>

![Version1](/.scrot.symlink/v1.png)

<br>

> *They say life is a journey, not a destination. Well, so are dotfiles...*

<br>

## Requirements

Here is the list of relevant packages/programs that I use. You don't need to install everything below, just choose what you want and then select which dotfiles to be symlinked in the `config` file.

### General
* `bspwm`                  (window manager)
* `sxhkd`                   (hotkey daemon)
* `rxvt-unicode`        (terminal emulator)
* `dunst`             (notification daemon)
* `feh`                 (background setter)
* `neovim`                    (text editor)
* `zsh`                             (shell)
* `tmux`             (terminal multiplexer)

### Panel
* `dzen` or `dzen2`       (panel clickable)
* `acpi`                          (battery)
* `bc`                       (various math)
* `bind-tools`        (network external ip)
* `xtitle`                   (window title)
* `wireless_tools`          (network essid)
* `lm_sensors`                   (cpu temp)
* `trayer`              (tray icon display)

### Other useful programs
* `xclip`               (clipboard manager)
* `ranger`                   (file manager)
* `sublime-text`              (text editor)
* `sxiv`                     (image viewer)
* `xautolock`     (for auto suspend script)
* `scrot`                   (screenshotter)
* `dmenu`                    (dynamic menu)
* `htop`                     (task manager)
* `mpd`                      (music player)
* `ncmpcpp`                (mpd controller)
* `mpv`                      (video player)
* `aria2`                (download utility)

<br>

## Installation

### General

- Install the packages/programs that you want as mentioned above.
- Clone this repository: 

```bash
$ git clone --depth=1 https://github.com/bvanhai/dotfiles

# .vim directory:
$ git clone --depth=1 https://github.com/bvanhai/.vim
```

- The dotfiles can simply be moved to their respective locations followed by a restart of the X server. I use symlinks to keep my file system organized so that all of these files live within the folder `dotfiles` in my home directory.

```bash
# Change directory to where you cloned the dotfiles:
$ cd dotfiles

# Edit 'config' file to specify which dotfiles are to be symlinked

# Install 'ruby' package:

# Then, run:
$ ruby install.rb
```

- Symlink the .vim directory:

```bash
$ ln -s /path/to/downloaded/.vim ~/.vim
```

After the files are moved/symlinked please read the configuration section below.

#### Suspend Service
The `suspend@.service` in `~/dotfiles/linux/etc/systemd/system` should be moved to `/etc/systemd/system/`, and enabled with `systemctl enable suspend@user.service` as root (replace user with the user you would like to enable the service for). The service relies on `.bin/echoDisplay.sh` to create `/tmp/DISPLAY.env` to ensure that sxlock is able to find the required display.

#### GTK Themes
I use `OMG-Dark` along with the `Azenis Icons` icon theme and `Pulse-Glass-Sapphire-Small` mouse cursor theme.

#### Font

I use default font is `Droid Sans` and terminal emulator font is `DejaVu Sans Mono`.

### Configuration

#### Panel
The panel can be configured from the variable file located at `.bin/panel/panel_settings` where some settings, such as `DUAL_BATT`, may need to be changed to match your system configuration. The panel and notifications are based off of a screen resolution of 1600x900. If you do not have a screen of this size `panel_settings` and all of the `_not` files will need to be modified to support alternate sizes.

Additional color configuration is available at `.bin/panel/panel-colors-dzen`.

#### Keybinds
Keybinds can be modified in the `.config/sxhkd/sxhkdrc` files.

#### Touchpad Synaptics
Only for laptop user, to configuration touchpad tap to click:
the `50-synaptics.conf` in `~/dotfiles/linux/etc/X11/xorg.conf.d` should be moved to `/etc/X11/xorg.conf.d/`, that's all.

#### Background
Feh uses any file located at `/home/Data/Wallpapers`, can be modified in the `.autostart` files.

#### Auto Suspend
The auto suspend settings can be modified at `.bin/autoSuspend.sh`.

_NOTE: The fullscreen setting only works for BSPWM._

#### xinitrc
My xinitrc launches a few applications you may not use. Simply remove them from the list and add your own.

#### Font Configuration

Install the `fontconfig-infinality` package.

<br>

## Kernel Configuration

For those who want my kernel .config (and I don’t recommend that since I extremely configured it to work on my end and it probably will result in several kernel panics before you get your kernel booting on your end) you can see it in `~/dotfiles/linux/boot/config-kernel-bvanhai` (The file is named config-kernel-bvanhai, just be sure to change it to .config and run these commands beforehand:

```bash
$ make oldconfig && make prepare
```

> *I’m not responsible for you breaking your system or losing important data.*

<br>

## Document
* [My GNU/Linux cheat-sheet - bvanhai](https://github.com/bvanhai/dotfiles/blob/master/doc/My-GNU-Linux-cheat-sheet.txt)
* [My Arch Linux install - bvanhai](https://github.com/bvanhai/dotfiles/blob/master/doc/My-Arch-Linux-install.txt)
* [My Gentoo Linux install - bvanhai](https://github.com/bvanhai/dotfiles/blob/master/doc/My-Gentoo-Linux-install.txt)
* [Awesome Linux Software - LewisVo](https://github.com/LewisVo/Awesome-Linux-Software)
* [The Linux Kernel Configuration Guide - DOTSLASHLINUX](https://dotslashlinux.com/2017/08/24/the-linux-kernel-configuration-guide-part-1)

<br>

## Credits

Acknowledgment; I established this dotfiles referring to the following user's repositories. Thus, I would appreciate it if you used my repository for reference. Thanks.

* These dotfiles are heavily based on [@tungel's dotfiles](https://github.com/tungel/dotfiles)
* Inspired by [@seenaburns's dotfiles](https://github.com/seenaburns/dotfiles)
* *Panel* based on [@benghaem's dotfiles](https://github.com/benghaem/dotfiles)
* *Conky* based on [@dobbie03's conky](https://dobbie03.deviantart.com/) and [@satya164's conky](https://satya164.deviantart.com/art/Conky-Google-Now-366545753) - [deviantart](http://www.deviantart.com/browse/all/customization/skins/linuxutil/applications/conky/)

Many thanks to the [dotfiles community](http://dotfiles.github.io/) and the creators of the incredibly useful tools.

<br>

## License

Licensed under the [MIT license](/doc/LICENSE.md).

<br>

**[⬆ back to top](#table-of-contents)**
