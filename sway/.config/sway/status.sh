#!/bin/sh
# One Pango status line; Sway runs this every 20 seconds.
# Optional argument: another battery's sysfs directory (or a test fixture).

battery_dir=${1:-/sys/class/power_supply/BAT0}
datetime=$(LC_ALL=C date '+%Y-%m-%d %a %H:%M')
separator='<span foreground="#5a524c">│</span>'

if [ ! -r "$battery_dir/capacity" ] || [ ! -r "$battery_dir/status" ]; then
	printf '%s\n' "$datetime"
	exit 0
fi

IFS= read -r capacity <"$battery_dir/capacity"
IFS= read -r status <"$battery_dir/status"
case "$capacity" in
	'' | *[!0-9]*)
		printf '%s\n' "$datetime"
		exit 0
		;;
esac

label=$(printf '%.3s' "$status")
color='#d4be98'
case "$status" in
	Charging)
		color='#a9b665'
		;;
	Discharging)
		if [ "$capacity" -le 10 ]; then
			color='#ea6962'
		elif [ "$capacity" -le 20 ]; then
			color='#d8a657'
		fi
		;;
esac

power_text=''
if [ -r "$battery_dir/power_now" ]; then
	IFS= read -r power <"$battery_dir/power_now"
	case "$power" in
		'' | *[!0-9]*) ;;
		*)
			watts=$(LC_ALL=C awk -v power="$power" 'BEGIN { printf "%.1f", power / 1000000 }')
			power_text="  $separator  $watts W"
			;;
	esac
fi
# Keep each update in one write: swaybar can display a partial pipe read.
printf '%s  %s  <span foreground="%s">BAT %s%% %s</span>%s\n' \
	"$datetime" "$separator" "$color" "$capacity" "$label" "$power_text"
