exec ~/.fehbg &
[[ -f ~/.config/X11/xresources ]] && xrdb -load ~/.config/X11/xresources
#Start conpositor
picom -b --config .config/picom/picom.conf
#Start he bar
dwmblocks &
# Start dwm
while true; do
	# Log stderror to a file 
	#dwm 2> ~/.dwm.log
	# No error logging
	dwm >/dev/null 2>&1
done
