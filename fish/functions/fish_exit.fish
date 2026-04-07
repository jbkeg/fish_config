function on_exit --on-process %self

# Save history
history save

# Clear temporary files (customize the path as needed)
rm -f $HOME/tmp/*

# Display a goodbye message
echo "Goodbye, (whoami)! You logged out at (date)."

# Optionally unmount network drives
# umount /Volumes/SomeNetworkDrive

# Clear the screen to protect privacy
clear
end
