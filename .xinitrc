#!/bin/sh

export DOTNET_CLI_TELEMETRY_OPTOUT=1

numlockx on

(
    sleep 0.1;
    if [ -d "$HOME/.local/share/xinitrc.d" ] ; then
        for f in "$HOME/.local/share/xinitrc.d/"?*.sh ; do
            [ -x "$f" ] && . "$f"
        done
        unset f
    fi
) &

DPI=96
sed -r "s/^.*Xft.dpi: [0-9]+/Xft.dpi: $DPI/" ~/.Xresources > ~/.Xresources.new && \
    mv ~/.Xresources.new ~/.Xresources && \
    xrdb -merge .Xresources
xrandr --dpi $DPI

#exec bspwm
#exec qtile start
exec i3
