#!/bin/bash
#ThermalControl
echo -----------------------Cooling systems
cpuusage=$( ps -A -o %cpu | awk '{s+=$1} END {print s ""}' )
irregulardelay=1
maxsaferpm=$( /Volumes/libreperfruntime/bin/smc -f f0Mx )
maxsaferpm=$( echo "${maxsaferpm}" | sed -n 7p | sed 's/[^0-9]*//g' )
echo $maxsaferpm MAX RPM
turbosaferpm=$(( ( $maxsaferpm / 4 ) + $maxsaferpm ))
echo $turbosaferpm MAX TURBOBOOST RPM
minsaferpm=$( /Volumes/libreperfruntime/bin/smc -f f0Mx )
minsaferpm=$( echo "${minsaferpm}" | sed -n 6p | sed 's/[^0-9]*//g' )
echo $minsaferpm MIN DETERMINED RPM
cpulimidle=$(( ( RANDOM % 50 )  + 49 ))
temp=$( /Volumes/libreperfruntime/bin/cycletmpcheck )
temp=$( echo "${temp}" | tr -d '[:space:]' | sed 's/[^0-9]*//g' )
osascript -e 'display notification "monitoring thermal systems" with title "libreperf"'
cycle=0
rpmopold=$minsaferpm
while true; do
cycle=$(( $cycle + 1 ))
cpuusage=$( ps -A -o %cpu | awk '{s+=$1} END {print s ""}' )
  echo -----------------------Cooling systems
  maxsaferpm=$( /Volumes/libreperfruntime/bin/smc -f f0Mx )
  maxsaferpm=$( echo "${maxsaferpm}" | sed -n 7p | sed 's/[^0-9]*//g' )
  echo $maxsaferpm MAX RPM
  turbosaferpm=$(( ( $maxsaferpm / 4 ) + $maxsaferpm ))
  echo $turbosaferpm MAX TURBOBOOST RPM
  minsaferpm=$( /Volumes/libreperfruntime/bin/smc -f f0Mx )
  minsaferpm=$( echo "${minsaferpm}" | sed -n 6p | sed 's/[^0-9]*//g' )
  echo $minsaferpm MIN DETERMINED RPM
  cpulimidle=$(( ( RANDOM % 50 )  + 32 ))
  temp=$( /Volumes/libreperfruntime/bin/cycletmpcheck )
  temp=$( echo "${temp}" | tr -d '[:space:]' | sed 's/[^0-9]*//g' )
echo $cpulimidle percent limit processing cooling
if [ $temp -gt "827" ]
  then
      echo CRITICAL TEMPRATURE
      echo OVERDRIVING FAN ENABLED $turbosaferpm rpm
      sudo /Volumes/libreperfruntime/bin/smc -k "FS! " -w 0001
      sudo /Volumes/libreperfruntime/bin/smc -k F0Tg -w $turbosaferpm
      cycle=0
      rpmopold=$turbosaferpm
  else
  if [ ${cpuusage%%.*} -gt $cpulimidle ]
    then
      echo MAXIMUM RPM MODE
      echo Current temprature $temp temprature
      rpmopsum=$(( $maxsaferpm + $rpmopold ))
      rpmop=$(( $rpmopsum / $cycle ))
      rpmopold=$rpmopsum
      sudo /Volumes/libreperfruntime/bin/smc -k "FS! " -w 0001
      sudo /Volumes/libreperfruntime/bin/smc -k F0Tg -w $rpmop
    else
      echo SERVO RPM MODE
      temp=$( /Volumes/libreperfruntime/bin/cycletmpcheck )
      temp=$( echo "${temp}" | tr -d '[:space:]' | sed 's/[^0-9]*//g' )
      echo $temp Celsius
      maxtemp=$(( ( ( RANDOM % 90 )  + 70 ) * 10 ))
      maxtemp=$maxtemp
      switchmode=$(( ( ( RANDOM % 65 )  + 55 ) * 10 ))
      switchmode=690
      echo $maxtemp temp limit
      echo 840 TURBO SWITCH MODE
      echo $switchmode switch mode
      if [[ $temp -gt $switchmode ]]; then
          rpmop=$(( $temp * $maxsaferpm / $maxtemp ))
          rpmopsum=$(( $rpmop + $rpmopold ))
          rpmop=$(( $rpmopsum / $cycle ))
          rpmopold=$rpmopsum
          echo safespinsampling $rpmopold $cycle
          echo Safe Spin $rpmop RPM
          sudo /Volumes/libreperfruntime/bin/smc -k "FS! " -w 0001
          sudo /Volumes/libreperfruntime/bin/smc -k F0Tg -w $rpmop
        else
          rpmopsum=$(( 0 + $rpmopold ))
          rpmop=$(( $rpmopsum / $cycle ))
          rpmopold=$rpmopsum
          sudo /Volumes/libreperfruntime/bin/smc -k "FS! " -w 0001
          sudo /Volumes/libreperfruntime/bin/smc -k F0Tg -w $rpmop
            if [ $rpmop -lt $minsaferpm ]
              then
                sudo /Volumes/libreperfruntime/bin/smc -k "FS! " -w 0001
                sudo /Volumes/libreperfruntime/bin/smc -k F0Tg -w 0000
              else
                echo silencing the silo
            fi
          sleep 1
      fi
    fi
  fi
if [ "$cycle" -gt "256" ]
  then
    cycle=0
    rpmopold=$minsaferpm
  else
    echo no need reset
fi
clamshellinfo=$(ioreg -r -k AppleClamshellState -d 4 | grep AppleClamshellState | head -1 | sed -n 1p)
clamshellinfo=$( echo "${clamshellinfo}" | sed 's/[^A-Z]*//g' )
echo $clamshellinfo
#ACSN no its not closed ACSY yes its closed
if [ $clamshellinfo = ACSY ]
  then
    cycle=0
    rpmopold=$maxsaferpm
    sudo /Volumes/libreperfruntime/bin/smc -k "FS! " -w 0001
    sudo /Volumes/libreperfruntime/bin/smc -k F0Tg -w $maxsaferpm
  else
    echo lid on
fi
sleep 1

done
