#!/bin/bash
swayidle -w timeout 300 '~/.config/hypr/scripts/lock.sh' \
            timeout 600 'systemctl suspend' \
            before-sleep '~/.config/hypr/scripts/lock.sh' &
