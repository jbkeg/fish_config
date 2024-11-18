#!/usr/bin/env fish

# Exit on error
function error
    echo -e "\033[0;31m❌ $argv\033[0m" >&2
    exit 1
end

# Logging functions
function log_color
    set color_code $argv[1]
    set message (string join " " $argv[2..-1])
    echo -e "\033[$color_code""m$message\033[0m" >&2
end

function log_red
    log_color "0;31" $argv
end

function log_blue
    log_color "0;34" $argv
end

function log_task
    log_blue "🔃" $argv
end

# Set the directory of the script
set script_dir (realpath (dirname (status --current-filename)))

# Backup directory
set -l backup_dir "$script_dir/backup"

# Restore Fish configuration
set -l config_dir (set -q XDG_CONFIG_HOME; and echo $XDG_CONFIG_HOME; or echo "$HOME/.config")
set -l fish_dir "$config_dir/fish"
set -l backup_fish_dir "$backup_dir/fish.bak"

log_task "Restoring Fish shell configuration..."
if test -d "$backup_fish_dir"
    if test -d "$fish_dir"
        log_task "Removing linked Fish configuration at $fish_dir..."
        rm -rf "$fish_dir"
    end
    log_task "Restoring backup Fish configuration from $backup_fish_dir..."
    mv $backup_fish_dir $fish_dir
else
    log_red "No backup found for Fish configuration. Skipping restoration."
end


# Restore Kitty configuration
set -l kitty_dir "$config_dir/kitty"
set -l backup_kitty_dir "$backup_dir/kitty.bak"

log_task "Restoring Kitty terminal configuration..."
if test -d "$backup_kitty_dir"
    if test -d "$kitty_dir"
        log_task "Removing linked Kitty configuration at $kitty_dir..."
        rm -rf "$kitty_dir"
    end
    log_task "Restoring backup Kitty configuration from $backup_kitty_dir..."
    mv $backup_kitty_dir $kitty_dir
else
    log_red "No backup found for Kitty configuration. Skipping restoration."
end

# Clean up backup directory
log_task "Cleaning up backup directory..."
find "$backup_dir" ! -name ".gitkeep" -delete

echo "Uninstallation complete. All configurations have been restored to their original state."
