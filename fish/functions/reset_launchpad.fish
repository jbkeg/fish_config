function reset_launchpad
    echo "Resetting Launchpad..."
    defaults write com.apple.dock ResetLaunchPad -bool true
    killall Dock
end
