#!/usr/bin/env fish

function log_color
    set color_code $argv[1]
    set message (string join " " $argv[2..-1])
    echo -e "\033[$color_code""m$message\033[0m" >&2
end

function log_task
    log_color "0;34" "🔃 $argv"
end

function log_error
    log_color "0;31" "❌ $argv"
end

function ensure_dir
    set dir $argv[1]
    if not test -d $dir
        mkdir -p $dir
    end
end

# Set directories
set script_dir (realpath (dirname (status --current-filename)))
set backup_dir "$script_dir/backup"

# Ensure backup directory exists
ensure_dir $backup_dir

# Fish configuration
log_task "Setting up Fish shell configuration..."
set config_dir (set -q XDG_CONFIG_HOME; and echo $XDG_CONFIG_HOME; or echo "$HOME/.config")
set fish_dir "$config_dir/fish"
set backup_fish_dir "$backup_dir/fish.bak"

if test -d $fish_dir
    log_task "Backing up existing Fish configuration to $backup_fish_dir..."
    ensure_dir $backup_fish_dir
    mv $fish_dir $backup_fish_dir
end

ln -sf "$script_dir/fish" $fish_dir
log_task "Fish shell configuration linked successfully."

# Kitty configuration
log_task "Setting up Kitty terminal configuration..."
set kitty_dir "$config_dir/kitty"
set backup_kitty_dir "$backup_dir/kitty.bak"

if test -d $kitty_dir
    log_task "Backing up existing Kitty configuration to $backup_kitty_dir..."
    ensure_dir $backup_kitty_dir
    mv $kitty_dir $backup_kitty_dir
end

ln -sf "$script_dir/others/kitty" $kitty_dir
log_task "Kitty terminal configuration linked successfully."

log_task "Setup completed successfully."
