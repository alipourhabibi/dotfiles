#!/bin/bash
# night light via wlsunset; click toggles (signal 9 refreshes the module)

temp=4000

if [[ "$1" == "toggle" ]]; then
    if pgrep -x wlsunset >/dev/null; then
        pkill -x wlsunset
    else
        # -T must be > -t; nearly equal = constant warm, no schedule
        setsid -f wlsunset -t "$temp" -T $((temp + 1)) >/dev/null 2>&1
    fi
    pkill -RTMIN+9 waybar
    exit 0
fi

if pgrep -x wlsunset >/dev/null; then
    echo "{\"text\":\"󰛨\", \"tooltip\":\"Night light on (${temp}K)\", \"class\":\"on\"}"
else
    echo '{"text":"󰛩", "tooltip":"Night light off", "class":"off"}'
fi
