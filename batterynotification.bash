#!bin/bash
# arg 1: threshold, 
# arg 2: polling  freq,

while true;
do
    battery="$( acpi -b | grep "Battery 0" | grep -o '[0-9]\+%' | tr -d '%' )"
    charging="$(acpi -b | grep "Battery 0" | grep -o "Discharging")"
    if $(test ${battery} -lt ${1} && test $charging = "Discharging")
    then
        twmnc  -c $( acpi -b | grep "Battery 0" | grep -o '[0-9]\+%') --bg "#cc0000" --fg black --size 50 --fs 80 --pos c   
        delay=$(test $battery -gt 10 && echo $(expr 9 \* 60)||test $battery -gt 4 && echo $(expr 5 \* 60)||echo 60)
        sleep $delay
    fi

    sleep $2

done



