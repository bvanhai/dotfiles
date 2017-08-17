# My Linux dotfiles

<br>

<img src="/.scrot.symlink/tux.jpg" data-canonical-src="https://github.com/bvanhai/dotfiles" width="512" height="192" />

🐧 This is a collection of **dotfiles** for use with **BSPWM** or any other **window manager** that requires the use of a **dzen panel**.
<br>
🐧 It is **my personal configuration** and includes all of the features I find necessary for a full WM experience.
<br>
🐧 My `.vim` folder is [here](https://github.com/bvanhai/.vim) and `My Arch Linux cheat-sheet` is [here](https://github.com/bvanhai/dotfiles/blob/master/doc/My-Arch-Linux-cheat-sheet.txt).
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
- [Manage subtrees](#manage-subtrees)
- [Document](#document)
- [Credits](#credits)

***********

<br>

## Screenshots

### Now

<br>

![Tmux1](/.scrot.symlink/tmux1.png)
![Tmux2](/.scrot.symlink/tmux2.png)
![Tmux3](/.scrot.symlink/tmux3.png)

<br>

### Old

<br>

![Clean](/.scrot.symlink/clean.png)
![Dirty](/.scrot.symlink/dirty.png) 
![Example](/.scrot.symlink/example.png)

<br>

### Older

<br>

![Example1](/.scrot.symlink/ago1.png)
![Example2](/.scrot.symlink/ago2.png)

<br>

> *They say life is a journey, not a destination. Well, so are dotfiles...*

<br>

## Requirements

Here is the list of relevant packages/programs that I use in Arch Linux. You don't need to install everything below, just choose what you want and then select which dotfile to be symlinked in the `config` file.

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
* `dzen2`                 (panel clickable)
* `acpi`                          (battery)
* `bc`                       (various math)
* `bind-tools`        (network external ip)
* `xtitle-git`               (window title)
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

*To use `deoplete` in `Neovim`, we must also install:*

```bash
$ sudo pacman -S python-pip
$ pip3 install --user neovim
```

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

# Install 'ruby':
$ pacman -S ruby

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

I use default font is `Droid Sans`, `Inconsolata-g` for text editor or terminal emulator and `Dejavu Sans Mono` for panel.

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

Install the package `fontconfig-infinality` and `freetype2-infinality` from the AUR:

```bash
$ yaourt -S fontconfig-infinality freetype2-infinality
```

<br>

## Document
* [My Arch Linux cheat-sheet - bvanhai](https://github.com/bvanhai/dotfiles/blob/master/doc/My-Arch-Linux-cheat-sheet.txt)
* [My Arch Linux install - bvanhai](https://github.com/bvanhai/dotfiles/blob/master/doc/My-Arch-Linux-install.txt)
* [Awesome Ubuntu Linux - VoLuong](https://github.com/VoLuong/Awesome-Ubuntu-Linux)

<br>

## Credits

Acknowledgment; I established this dotfiles referring to the following user's repositories. Thus, I would appreciate it if you used my repository for reference. Thanks.

* These dotfiles are heavily based on [@tungel's dotfiles](https://github.com/tungel/dotfiles)
* Inspired by [@seenaburns's dotfiles](https://github.com/seenaburns/dotfiles)
* *Panel* based on [@benghaem's dotfiles](https://github.com/benghaem/dotfiles)
* *Conky* based on [@dobbie03's conky](https://dobbie03.deviantart.com/) and [@satya164's conky](https://satya164.deviantart.com/art/Conky-Google-Now-366545753) - [deviantart](http://www.deviantart.com/browse/all/customization/skins/linuxutil/applications/conky/)

Many thanks to the [dotfiles community](http://dotfiles.github.io/) and the creators of the incredibly useful tools.

<br>

**[⬆ back to top](#table-of-contents)**
