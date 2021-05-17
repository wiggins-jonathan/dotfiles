# This cats every thermal sensor, causing the fan to turn on
while true; do
  cat /sys/class/thermal/thermal_zone?/temp
  sleep 1
done
