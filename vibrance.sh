VALUE=500
class_name="csgo_linux64"
# regex for extracting hex id's
grep_id='0[xX][a-zA-Z0-9]\{7\}'

xprop -spy -root _NET_ACTIVE_WINDOW | grep --line-buffered -o $grep_id |
while read -r id; do
    class="`xprop -id $id WM_CLASS | grep $class_name`"
    if [ -n "$class" ]; then
        nvidia-settings -a "DigitalVibrance=$VALUE" > /dev/null
    else
        nvidia-settings -a "DigitalVibrance=0" > /dev/null
    fi
done
