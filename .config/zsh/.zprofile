if [ "$(tty)" = "/dev/tty1" ]; then
pgrep -x dwm || exec startx
fi
