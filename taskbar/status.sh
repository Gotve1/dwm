#!/bin/bash

while true; do

  # Volume
  VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+%' | head -1)
  
  # Brightness
  BRIGHT=$(brightnessctl get | awk '{print int($1/255*100)"%"}')
  
  # Time
  TIME=$(date "+%I:%M %p")
  
  # Battery
  BATTERY=$(acpi -b | grep -Po '[0-9]+(?=%)' | head -1)

  # Network (get connected Wi-Fi SSID or "Disconnected")
  WIFI=$(iwgetid -r)
  if [ -z "$WIFI" ]; then
    WIFI="Disconnected"
  fi

  xsetroot -name "|💡 $BRIGHT | 🔉 $VOL | 🕓 $TIME | 🔋 $BATTERY% | 📶 $WIFI |"
done
