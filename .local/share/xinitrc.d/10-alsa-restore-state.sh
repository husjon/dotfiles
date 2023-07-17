#!/bin/bash

STATE_FILE=~/.config/alsa.state

alsactl -f ${STATE_FILE} restore 0

jack_wait -w -t 60 2> /dev/null && {
    alsactl -f ${STATE_FILE} restore 0
}
