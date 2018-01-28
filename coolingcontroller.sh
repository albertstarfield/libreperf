#!/bin/bash
#ThermalControl
echo -----------------------Cooling systems
cpuusage=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/cpu/cpuusage )
irregulardelay=1
maxsaferpm=$( /Volumes/libreperfruntime/bin/smc -f f0Mx )
maxsaferpm=$( echo "${maxsaferpm}" | sed -n 7p | sed 's/[^0-9]*//g' )
echo $maxsaferpm MAX RPM
turbosaferpm=$(( ( $maxsaferpm / 4 ) + $maxsaferpm ))
echo $turbosaferpm MAX TURBOBOOST RPM
minsaferpm=$( /Volumes/libreperfruntime/bin/smc -f f0Mx )
minsaferpm=$( echo "${minsaferpm}" | sed -n 6p | sed 's/[^0-9]*//g' )
echo $minsaferpm MIN DETERMINED RPM
cpulimidle=$(( ( RANDOM % 24 )  + 19 ))
temp=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/temp/cputherm )
osascript -e 'display notification "monitoring thermal systems" with title "libreperf"'
cycle=0
rpmop=$minsaferpm
OHC=0
rpmopold=$minsaferpm
while true; do
  if [ ! -d "/Volumes/libreperfruntime/sys/temp/cputherm" ]
    then
      sudo /Volumes/libreperfruntime/bin/smc -k F0Tg -w $maxsaferpm
      sudo /Volumes/libreperfruntime/bin/smc -k "FS! " -w 0000
      echo thermalinput not Detected
      sleep 365
    else
      echo Running normally
  fi
  #powersavinglinepatch
  rescman=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/rescman )
  if [[ $rescman = apple && $cycle -gt 64 ]]; then
      echo apple management resource mode
      coalescingsleep=$(( ( RANDOM % 256 )  + 32 ))
      sudo /Volumes/libreperfruntime/bin/smc -k "FS! " -w 0001
      sudo /Volumes/libreperfruntime/bin/smc -k F0Tg -w $rpmop
      sleep $coalescingsleep
    else
      echo libreperf management mode
  fi
cycle=$(( $cycle + 1 ))
cpuusage=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/cpu/cpuusage )
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
  temp=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/temp/cputherm )
echo $cpulimidle percent limit processing cooling
if [ $temp -gt "790" ]
  then
      echo CRITICAL TEMPRATURE
      echo OVERDRIVING FAN ENABLED $turbosaferpm rpm
      rpmopsum=$(( $turbosaferpm + $rpmopold ))
      rpmop=$(( $rpmopsum / $cycle ))
      rpmopold=$rpmopsum
      sudo /Volumes/libreperfruntime/bin/smc -k "FS! " -w 0001
      sudo /Volumes/libreperfruntime/bin/smc -k F0Tg -w $rpmop
      sleep 1
  else
  if [[ ${cpuusage%%.*} -gt $cpulimidle && $temp -gt "700" ]]; then
      echo MAXIMUM RPM MODE
      echo Current temprature $temp temprature
      rpmopsum=$(( $maxsaferpm + $rpmopold ))
      rpmop=$(( $rpmopsum / $cycle ))
      rpmopold=$rpmopsum
      sudo /Volumes/libreperfruntime/bin/smc -k "FS! " -w 0001
      sudo /Volumes/libreperfruntime/bin/smc -k F0Tg -w $rpmop
      sleep 1
    else
      echo SERVO RPM MODE
      temp=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/temp/cputherm )
      echo $temp Celsius
      maxtemp=$(( ( ( RANDOM % 90 )  + 70 ) * 10 ))
      maxtemp=$maxtemp
      switchmode=$(( ( ( RANDOM % 65 )  + 55 ) * 10 ))
      switchmode=690
      echo $maxtemp temp limit
      echo 790 TURBO SWITCH MODE
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
      if [ ${cpuusage%%.*} -gt 40 ]; then
        echo Current temprature $temp temprature
        echo adding values
        rpmopsum=$(( $maxsaferpm + $rpmopold ))
        rpmop=$(( $rpmopsum / $cycle ))
        rpmopold=$rpmopsum
        sudo /Volumes/libreperfruntime/bin/smc -k "FS! " -w 0001
        sudo /Volumes/libreperfruntime/bin/smc -k F0Tg -w $rpmop
      else
        echo run normal
      fi
    fi
  fi
if [ "$temp" -gt "700" ] || [ ${cpuusage%%.*} -gt 60 ] || [ ${cpuusage%%.*} -lt 20 ] || [ "$temp" -lt "490" ]
  then
    echo Overheat HIT RATE $OHC
    OHC=$(( $OHC + 1 ))
      if [ $OHC -gt 7 ]; then
        OHC=0
        cycle=0
        rpmopold=$rpmop
        sudo sh /Volumes/libreperfruntime/coolingcontroller.sh
      else
    echo no need reset v1
  fi
  else
    echo no need reset v2
fi
clamshellinfo=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/hwmorph/clamshellinfo )
echo $clamshellinfo
#ACSN no its not closed ACSY yes its closed
if [[ $clamshellinfo = ACSY && $TEMP -gt 750 ]]; then
    cycle=0
    rpmopold=$rpmop
    sudo /Volumes/libreperfruntime/bin/smc -k "FS! " -w 0001
    sudo /Volumes/libreperfruntime/bin/smc -k F0Tg -w $turbosaferpm
  else
    echo lid on
fi
sleep 1

done
