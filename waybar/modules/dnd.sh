#!/usr/bin/env bash
# Waybar: mako do-not-disturb state. Refreshed by signal 8 (pkill -RTMIN+8 waybar).
if makoctl mode | grep -qx do-not-disturb; then
  echo '{"text":"󰂛","tooltip":"Do Not Disturb: on (Mod+N)","class":"on"}'
else
  echo '{"text":"󰂚","tooltip":"Notifications: on (Mod+N)","class":"off"}'
fi
