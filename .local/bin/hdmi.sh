#!/bin/bash
intern="$(xrandr | awk '/eDP/{print $1}')"
extern="$(xrandr | awk -e '/(HDMI.*)/{print $1}')"
# pom="$(optimus-manager --print-mode | cut -d ':' -f 2)"
echo $extern
options="$1"

# if [ $pom == 'nvidia' ]; then
# 	if xrandr | grep "$extern disconnected"; then
#     	xrandr --output "$extern" --off --output "$intern" --auto
# 	else
#     	xrandr --output "$intern" --off --output "$extern" --auto
# 	fi
# elif [ $pom == 'hybrid' ]; then
# 	if xrandr | grep "$extern connected"; then
# 	xrandr --output "$extern" --auto --"$positin"-of "$intern"
# 	else
# 	xrandr --output "$extern" --off
# 	fi
# fi
if [ $options == '--opt1' ]; then
	xrandr --output "$extern" --off --output "$intern" --auto
elif [ $options == '--opt2' ]; then
    echo $"xrandr --output "$extern" --off --output "$intern" --auto"
	xrandr --output "$extern" --auto --right-of "$intern" --auto
elif [ $options == '--opt3' ]; then
	xrandr --output "$extern" --auto --right-of "$intern" --auto
    sleep 1
	xrandr --output "$extern" --auto --left-of "$intern" --auto
elif [ $options == '--opt4' ]; then
	xrandr --output "$extern" --auto --output "$intern" --off
fi
