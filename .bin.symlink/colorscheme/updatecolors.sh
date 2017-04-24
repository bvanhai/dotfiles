# Macro for updating colors when working on a new scheme

. $HOME/.bin/colorscheme/gen-xr $1; xrdb -merge ~/.Xresources;
