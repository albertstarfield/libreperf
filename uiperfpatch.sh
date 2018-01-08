while true; do
#!/bin/bash
#powersavinglinepatch
rescman=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/rescman )
if [ $rescman = apple ]
  then
    echo apple management resource mode
    coalescingsleep=$(( ( RANDOM % 128 )  + 32 ))
    sleep $coalescingsleep

  else
    echo libreperf management mode
fi
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
cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.dock single-app -bool false; done
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
echo phase
cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.dock showhidden -bool true; done
#gift for compositor
sudo defaults write /Library/Preferences/com.apple.windowserver Compositor -dict deferredUpdates 0
sudo defaults write /Library/Preferences/com.apple.windowserver QuartzGLEnabled -boolean YES
sleep 4
sleep 8
sleep 27
sleep 8
done
