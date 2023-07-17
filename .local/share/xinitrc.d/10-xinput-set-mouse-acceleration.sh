#!/bin/bash

[[ "$HOSTNAME" == "workstation" ]] && {
    xinput --set-prop 'pointer:Logitech MX Master 2S' 'libinput Accel Speed' 0.5
}
