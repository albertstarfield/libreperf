while true; do
  #powersavinglinepatch
  rescman=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/rescman )
  if [ $rescman = apple ]
    then
      echo apple management resource mode
      coalescingsleep=$(( ( RANDOM % 31 )  + 16 ))
      sleep $coalescingsleep
    else
      echo libreperf management mode
  fi
killconfirm=0
  Clear
killconfirm=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/killconfirm )
echo $killconfirm  value---------------- phase 1

killconfirmpn=$( /Volumes/libreperfruntime/bin/ps -c -p $killconfirm )
killconfirmpn=$( echo "${killconfirmpn}" | sed 1,1d | sed -n 1p | sed 's/[^a-zA-Z]*//g' )
if [ $killconfirm = 0 ]; then
  killconfirmpn=kernel_task
else
  echo meong
fi
echo name process $killconfirmpn value----------phase 2
if [[ $killconfirmpn != "uBar" && $killconfirmpn != "WindowServer" && $killconfirmpn != "loginwindow" && $killconfirmpn != "kernel_task" && $killconfirmpn != "sh" && $killconfirmpn != "bash" && $killconfirmpn != "launchd" && $killconfirmpn != "UserEventAgent" && $killconfirmpn != "Terminal" && $killconfirmpn != "node" && $killconfirmpn != "spindump" && $killconfirmpn != "kextd" && $killconfirmpn != "launchd" && $killconfirmpn != "coreduetd" && $killconfirmpn != "SystemUIServer" && $killconfirmpn != "sudo" && $killconfirmpn != "Dock" && $killconfirmpn != "coreaudiod" ]]; then
  echo phase killing
  sudo killall -KILL $killconfirmpn
  sudo kill -9 $killconfirm
  echo kill confirmed $killconfirm
else
  echo process failure $killconfirmpn $killconfirm
fi
#echo 0 > /Volumes/libreperfruntime/sys/killconfirm
echo phase 3
sleep 1
done
