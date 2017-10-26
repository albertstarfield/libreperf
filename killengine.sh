while true; do
  Clear
killconfirm=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/killconfirm )
echo $killconfirm phase 1
killconfirmpn=$( /Volumes/libreperfruntime/bin/ps -c -p $killconfirm )
killconfirmpn=$( echo "${killconfirmpn}" | sed 1,1d | sed -n 1p | sed 's/[^a-zA-Z]*//g' )
echo name process $killconfirmpn phase 2
if [[ $killconfirm != "0" && $killconfirmpn != "WindowServer" && $killconfirmpn != "loginwindow" && $killconfirmpn != "kernel_task" && $killconfirmpn != "sh" && $killconfirmpn != "bash" && $killconfirmpn != "launchd" && $killconfirmpn != "UserEventAgent" && $killconfirmpn != "Terminal" && $killconfirmpn != "node" && $killconfirmpn != "spindump" && $killconfirmpn != "kextd" && $killconfirmpn != "launchd" && $killconfirmpn != "coreduetd" && $killconfirmpn != "SystemUIServer" && $killconfirmpn != "sudo" && $killconfirmpn != "Dock" && $killconfirmpn != "coreaudiod" ]]; then
  echo phase killing
  sudo kill -9 $killconfirm
  echo kill confirmed $killconfirm
else
  echo process failure $killconfirmpn $killconfirm
fi
echo 0 > /Volumes/libreperfruntime/sys/killconfirm
echo phase 3
sleep 1
done
