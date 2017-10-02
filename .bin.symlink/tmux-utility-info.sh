#!/bin/sh
# Displays info about wm, font, gtk theme
# copied from z3bra's blog

version="1.0.1"

c00=$'\e[0;30m'
c01=$'\e[0;31m'
c02=$'\e[0;32m'
c03=$'\e[0;33m'
c04=$'\e[0;34m'
c05=$'\e[0;35m'
c06=$'\e[0;36m'
c07=$'\e[0;37m'
c08=$'\e[1;30m'
c09=$'\e[1;31m'
c10=$'\e[1;32m'
c11=$'\e[1;33m'
c12=$'\e[1;34m'
c13=$'\e[1;35m'
c14=$'\e[1;36m'
c15=$'\e[1;37m'

f0=$'\e[1;30m'
f1=$'\e[1;37m'
f2=$'\e[0;37m'

#battery= cat /sys/class/power_supply/BAT0/capacity
kernel=$(uname -r)
distro=$(uname -o)
#distro=$(cat /etc/os-release | grep PRETTY_NAME | cut -d '"' -f2)

if [[ -n $DISPLAY ]]; then
    if grep -q 'arch' /etc/os-release; then
        pkgnum=$(pacman -Q | wc -l)
        birthd=$(sed -n '1s/^\[\([0-9-]*\).*$/\1/p' /var/log/pacman.log | tr - .)
    elif grep -q 'gentoo' /etc/os-release; then
        pkgnum=$(ls -d /var/db/pkg/*/* | wc -l)
    else
        pkgnum=
    fi
    WM=$(xprop -root _NET_SUPPORTING_WM_CHECK)
    wmname=$(xprop -id ${WM//* } _NET_WM_NAME | sed -re 's/.*= "(.*)"/\1/')
    termfn=$(awk -F: '/^URxvt.font/ {print $3}' ~/.Xresources)
    systfn=$(sed -n 's/^.*font.*"\(.*\)".*$/\1/p' ~/.gtkrc-2.0)
    gtktheme=$(sed -n 's/^gtk-theme.*"\(.*\)".*$/\1/p' ~/.gtkrc-2.0)
    icons=$(sed -n 's/^.*icon.*"\(.*\)".*$/\1/p' ~/.gtkrc-2.0)
else
    wmname="TTY"
    termfn="awk -F= '/^FONT/ {print $2}' /etc/vconsole.conf"
    systfn="none"
fi

user=$(whoami)

IP=$(ifconfig -a | awk '/broadcast/ {print $2; exit}')

today=$(date +%Y.%m.%d)

root="$(df -h / | sed '1d' | awk '{print $3}') / $(df -h / | sed '1d' | awk '{print $2}')"
media="$(df -h /home/media | sed '1d' | awk '{print $3}') / $(df -h /home/media | sed '1d' | awk '{print $2}')"

# Shell
shell+="$("$SHELL" --version)"
# Remove unwanted info.
shell="${shell/ ${SHELL##*/}}"
shell="${shell/, version}"
shell="${shell/xonsh\//xonsh }"
shell="${shell/options*}"
shell="${shell/\(*\)}"

cat << EOF




             ${c00}▉▉  | ${f1}OS ${f0}........... $f2$distro
             ${c08}  ▉▉| ${f1}Host ${f0}......... $f2$HOSTNAME
             ${c01}▉▉  | ${f1}User ${f0}......... $f2$user
             ${c09}  ▉▉| ${f1}Today ${f0}........ $f2$today
             ${c02}▉▉  |
             ${c10}  ▉▉| ${f1}Kernel ${f0}....... $f2$kernel
             ${c03}▉▉  | ${f1}WM ${f0}........... $f2$wmname
             ${c11}  ▉▉| ${f1}Shell ${f0}........ $f2$shell
             ${c04}▉▉  | ${f1}Packages ${f0}..... $f2$pkgnum
             ${c12}  ▉▉| 
             ${c05}▉▉  | ${f1}Theme ${f0}........ $f2$gtktheme
             ${c13}  ▉▉| ${f1}Icon ${f0}......... $f2$icons
             ${c06}▉▉  | ${f1}Font ${f0}......... $f2$termfn
             ${c14}  ▉▉|
             ${c07}▉▉  | ${f1}Root ${f0}......... $f2$root
             ${c15}  ▉▉| ${f1}Media ${f0}........ $f2$media

EOF
