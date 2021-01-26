#!/bin/sh


case "$1" in
    logout)
        i3-msg exit
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {logout|reboot|shutdown}"
        exit 2
esac

exit 0
