while true; do
#!/bin/bash
#powersavinglinepatch
rescman=$( /libreperfruntime/bin/cat /libreperfruntime/sys/rescman )
coalescingsleep=$(( ( RANDOM % 360 )  + 32 ))
if [ $rescman = apple ]
  then
    echo apple management resource mode
    coalescingsleep=$(( ( RANDOM % 360 )  + 32 ))
    sleep $coalescingsleep

  else
    echo libreperf management mode
fi
#Expense on Performance
#Resource Window Manager Start
averageload=$( /libreperfruntime/bin/cat /libreperfruntime/sys/cpu/cpuusage )
if [ "$averageload" -gt "50" ]; then
cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.dock minimize-to-application -bool YES; done
#UXOptimization
echo phase
sleep 4
cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.dock springboard-show-duration -float 0; done
cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.dock springboard-hide-duration -float 0; done
cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.dock springboard-page-duration -float 0; done

cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.CrashReporter DialogType none; done
cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.universalaccess reduceTransparency -bool true; done
cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.dashboard mcx-disabled -boolean YES; done
cd /Users/; for i in *; do sudo -u "$i" defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false; done
cd /Users/; for i in *; do sudo -u "$i" defaults write -g QLPanelAnimationDuration -float 0; done
cd /Users/; for i in *; do sudo -u "$i" defaults write NSGlobalDomain NSWindowResizeTime -float 0.001; done
cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.dock launchanim -bool false; done
cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.dock expose-animation-duration -float 0.1; done
cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.Dock autohide-delay -float 0; done
cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.finder DisableAllAnimations -bool true; done
cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.mail DisableReplyAnimations -bool true; done
cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.mail DisableSendAnimations -bool true; done
cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.Safari WebKitInitialTimedLayoutDelay 0.25; done
defaults delete NSDisableAutomaticTermination
echo phase
sleep 4
cd /Users/; for i in *; do sudo -u "$i" defaults write -g NSDisableAutomaticTermination -bool no; done
cd /Users/; for i in *; do sudo -u "$i" defaults write com.google.Chrome NSQuitAlwaysKeepsWindows -bool false; done
cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.Safari NSQuitAlwaysKeepsWindows -bool false; done
cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.dock single-app -bool true; done
cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.dock mineffect -string scale; done
cd /Users/; for i in *; do sudo -u "$i" defaults write NSGlobalDomain NSAppSleepDisabled -bool no; done
cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.finder DisableAllAnimations -bool true; done
cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.CrashReporter DialogType none; done
cd /Users/; for i in *; do sudo -u "$i" defaults write -g NSAutomaticWindowAnimationsEnabled -bool true; done
echo phase
sleep 4
cd /Users/; for i in *; do sudo -u "$i" defaults write -g NSScrollAnimationEnabled -bool false; done
cd /Users/; for i in *; do sudo -u "$i" defaults write -g NSWindowResizeTime -float 0.001; done
cd /Users/; for i in *; do sudo -u "$i" defaults write -g QLPanelAnimationDuration -float 0; done
cd /Users/; for i in *; do sudo -u "$i" defaults write -g NSScrollViewRubberbanding -bool false; done
cd /Users/; for i in *; do sudo -u "$i" defaults write -g NSDocumentRevisionsWindowTransformAnimation -bool false; done
cd /Users/; for i in *; do sudo -u "$i" defaults write -g NSToolbarFullScreenAnimationDuration -float 0; done
cd /Users/; for i in *; do sudo -u "$i" defaults write -g NSBrowserColumnAnimationSpeedMultiplier -float 0; done
cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.dashboard devmode YES; done
cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.dt.Xcode UseSanitizedBuildSystemEnvironment -bool NO; done
#killall -KILL SystemUIServer
#killall -KILL Dock
echo phase
cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.dock showhidden -bool true; done
#Disables apple services
TODISABLE=('com.apple.security.keychainsyncingoveridsproxy' 'com.apple.personad' 'com.apple.passd' 'com.apple.screensharing.MessagesAgent' 'com.apple.CommCenter-osx' 'com.apple.Maps.mapspushd' 'com.apple.Maps.pushdaemon' 'com.apple.photoanalysisd' 'com.apple.telephonyutilities.callservicesd' 'com.apple.AirPlayUIAgent' 'com.apple.AirPortBaseStationAgent' 'com.apple.CalendarAgent' 'com.apple.DictationIM' 'com.apple.iCloudUserNotifications' 'com.apple.familycircled' 'com.apple.familycontrols.useragent' 'com.apple.familynotificationd' 'com.apple.gamed' 'com.apple.icloud.findmydeviced.findmydevice-user-agent' 'com.apple.icloud.fmfd' 'com.apple.imagent' 'com.apple.cloudfamilyrestrictionsd-mac' 'com.apple.cloudpaird' 'com.apple.cloudphotosd' 'com.apple.DictationIM' 'com.apple.assistant_service' 'com.apple.CallHistorySyncHelper' 'com.apple.CallHistoryPluginHelper' 'com.apple.AOSPushRelay' 'com.apple.IMLoggingAgent' 'com.apple.geodMachServiceBridge' 'com.apple.syncdefaultsd' 'com.apple.security.cloudkeychainproxy3' 'com.apple.security.idskeychainsyncingproxy' 'com.apple.security.keychain-circle-notification' 'com.apple.sharingd' 'com.apple.appleseed.seedusaged' 'com.apple.cloudd' 'com.apple.assistantd' 'com.apple.parentalcontrols.check' 'com.apple.parsecd' 'com.apple.identityservicesd')

for agent in "${TODISABLE[@]}"
do
    {
        sudo launchctl unload -w /System/Library/LaunchAgents/${agent}.plist
        launchctl unload -w /System/Library/LaunchAgents/${agent}.plist
    } &> /dev/null
    echo "[OK] Agent ${agent} disabled"
done

# Daemons to disable
TODISABLE=('com.apple.netbiosd' 'com.apple.preferences.timezone.admintool' 'com.apple.preferences.timezone.auto' 'com.apple.remotepairtool' 'com.apple.rpmuxd' 'com.apple.security.FDERecoveryAgent' 'com.apple.icloud.findmydeviced' 'com.apple.findmymacmessenger' 'com.apple.familycontrols' 'com.apple.findmymac' 'com.apple.SubmitDiagInfo' 'com.apple.screensharing' 'com.apple.appleseed.fbahelperd' 'com.apple.apsd' 'com.apple.AOSNotificationOSX' 'com.apple.FileSyncAgent.sshd' 'com.apple.ManagedClient.cloudconfigurationd' 'com.apple.ManagedClient.enroll' 'com.apple.ManagedClient' 'com.apple.ManagedClient.startup' 'com.apple.iCloudStats' 'com.apple.locationd' 'com.apple.mbicloudsetupd' 'com.apple.laterscheduler' 'com.apple.awacsd' 'com.apple.eapolcfg_auth' 'com.apple.familycontrols')

for daemon in "${TODISABLE[@]}"
do
    {
        sudo launchctl unload -w /System/Library/LaunchDaemons/${daemon}.plist
        launchctl unload -w /System/Library/LaunchDaemons/${daemon}.plist
    } &> /dev/null
    echo "[OK] Daemon ${daemon} disabled"
done
    else
      cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.dock minimize-to-application -bool NO; done
      #UXOptimization
      echo phase
      sleep 4
      cd /Users/; for i in *; do sudo -u "$i" defaults delete com.apple.dock springboard-show-duration; done
      cd /Users/; for i in *; do sudo -u "$i" defaults delete com.apple.dock springboard-hide-duration; done
      cd /Users/; for i in *; do sudo -u "$i" defaults delete com.apple.dock springboard-page-duration; done

      cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.CrashReporter DialogType none; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.universalaccess reduceTransparency -bool false; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.dashboard mcx-disabled -boolean NO; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool true; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write -g QLPanelAnimationDuration -float 0; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write NSGlobalDomain NSWindowResizeTime -float 0.001; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.dock launchanim -bool true; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.dock expose-animation-duration -float 0.1; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.Dock autohide-delay -float 0; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.finder DisableAllAnimations -bool false; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.mail DisableReplyAnimations -bool false; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.mail DisableSendAnimations -bool false; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.Safari WebKitInitialTimedLayoutDelay 0.25; done
      defaults delete NSDisableAutomaticTermination
      echo phase
      sleep 4
      cd /Users/; for i in *; do sudo -u "$i" defaults write -g NSDisableAutomaticTermination -bool YES; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write com.google.Chrome NSQuitAlwaysKeepsWindows -bool false; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.Safari NSQuitAlwaysKeepsWindows -bool false; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.dock single-app -bool false; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.dock mineffect -string genie; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write NSGlobalDomain NSAppSleepDisabled -bool yes; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.finder DisableAllAnimations -bool false; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.CrashReporter DialogType none; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write -g NSAutomaticWindowAnimationsEnabled -bool false; done
      echo phase
      sleep 4
      cd /Users/; for i in *; do sudo -u "$i" defaults write -g NSScrollAnimationEnabled -bool true; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write -g NSWindowResizeTime -float 0.001; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write -g QLPanelAnimationDuration -float 0; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write -g NSScrollViewRubberbanding -bool true; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write -g NSDocumentRevisionsWindowTransformAnimation -bool false; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write -g NSToolbarFullScreenAnimationDuration -float 0; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write -g NSBrowserColumnAnimationSpeedMultiplier -float 0; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.dashboard devmode YES; done
      cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.dt.Xcode UseSanitizedBuildSystemEnvironment -bool YES; done
      echo phase
      cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.dock showhidden -bool true; done
      #enables apple services
TODISABLE=('com.apple.security.keychainsyncingoveridsproxy' 'com.apple.personad' 'com.apple.passd' 'com.apple.screensharing.MessagesAgent' 'com.apple.CommCenter-osx' 'com.apple.Maps.mapspushd' 'com.apple.Maps.pushdaemon' 'com.apple.photoanalysisd' 'com.apple.telephonyutilities.callservicesd' 'com.apple.AirPlayUIAgent' 'com.apple.AirPortBaseStationAgent' 'com.apple.CalendarAgent' 'com.apple.DictationIM' 'com.apple.iCloudUserNotifications' 'com.apple.familycircled' 'com.apple.familycontrols.useragent' 'com.apple.familynotificationd' 'com.apple.gamed' 'com.apple.icloud.findmydeviced.findmydevice-user-agent' 'com.apple.icloud.fmfd' 'com.apple.imagent' 'com.apple.cloudfamilyrestrictionsd-mac' 'com.apple.cloudpaird' 'com.apple.cloudphotosd' 'com.apple.DictationIM' 'com.apple.assistant_service' 'com.apple.CallHistorySyncHelper' 'com.apple.CallHistoryPluginHelper' 'com.apple.AOSPushRelay' 'com.apple.IMLoggingAgent' 'com.apple.geodMachServiceBridge' 'com.apple.syncdefaultsd' 'com.apple.security.cloudkeychainproxy3' 'com.apple.security.idskeychainsyncingproxy' 'com.apple.security.keychain-circle-notification' 'com.apple.sharingd' 'com.apple.appleseed.seedusaged' 'com.apple.cloudd' 'com.apple.assistantd' 'com.apple.parentalcontrols.check' 'com.apple.parsecd' 'com.apple.identityservicesd')

for agent in "${TODISABLE[@]}"
do
    {
        sudo launchctl load -w /System/Library/LaunchAgents/${agent}.plist
        launchctl load -w /System/Library/LaunchAgents/${agent}.plist
    } &> /dev/null
    echo "[OK] Agent ${agent} disabled"
done

# Daemons to disable
TODISABLE=('com.apple.netbiosd' 'com.apple.preferences.timezone.admintool' 'com.apple.preferences.timezone.auto' 'com.apple.remotepairtool' 'com.apple.rpmuxd' 'com.apple.security.FDERecoveryAgent' 'com.apple.icloud.findmydeviced' 'com.apple.findmymacmessenger' 'com.apple.familycontrols' 'com.apple.findmymac' 'com.apple.SubmitDiagInfo' 'com.apple.screensharing' 'com.apple.appleseed.fbahelperd' 'com.apple.apsd' 'com.apple.AOSNotificationOSX' 'com.apple.FileSyncAgent.sshd' 'com.apple.ManagedClient.cloudconfigurationd' 'com.apple.ManagedClient.enroll' 'com.apple.ManagedClient' 'com.apple.ManagedClient.startup' 'com.apple.iCloudStats' 'com.apple.locationd' 'com.apple.mbicloudsetupd' 'com.apple.laterscheduler' 'com.apple.awacsd' 'com.apple.eapolcfg_auth' 'com.apple.familycontrols')

for daemon in "${TODISABLE[@]}"
do
    {
        sudo launchctl load -w /System/Library/LaunchDaemons/${daemon}.plist
        launchctl load -w /System/Library/LaunchDaemons/${daemon}.plist
    } &> /dev/null
    echo "[OK] Daemon ${daemon} disabled"
done
fi
#Resource Window Manager End
#gift for compositor
sudo defaults write /Library/Preferences/com.apple.windowserver Compositor -dict deferredUpdates 0
sudo defaults write /Library/Preferences/com.apple.windowserver QuartzGLEnabled -boolean YES
#for batter indic
cpuusage=$( /libreperfruntime/bin/cat /libreperfruntime/sys/cpu/cpuusage )
IOPROC=$( /libreperfruntime/bin/cat /libreperfruntime/sys/IOstats/IOPROC )
#reboot UI

cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.PowerChime ChimeOnAllHardware -bool true; open /System/Library/CoreServices/PowerChime.app; done
if [[ $cpuusage -lt 30 && $IOPROC -lt 1 ]]; then
  sudo killall -KILL Dock
  sudo killall -KILL SystemUIServer
  sudo killall -KILL Finder
else
  echo awaiting for perfect moment
fi
sleep $coalescingsleep

sleep 4
sleep 8
sleep 27
sleep 8
done
