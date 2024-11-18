set -gx XDG_CONFIG_HOME $HOME/.config

# Locale
# set -gx LANG ko_KR.UTF-8

# Terminal
export TERM=xterm-256color
export TERMINAL="kitty"

# Editor Configuration
set -Ux EDITOR code --wait
if test -n "$SSH_TTY"
    set EDITOR vim
end
alias edit=micro

# Homebrew Initialization
eval "$(/opt/homebrew/bin/brew shellenv)"

# Yazi Navigation
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# eza Aliases (ls replacement)
if command -v eza >/dev/null
    alias ls="eza --group --header --classify --icons --group-directories-first"
    alias lsa="ls --all"
    alias ll="ls --long"
    alias lla="ll --all"
    alias lr="ls --recurse --level 2"
    alias lra="lr --all"
    alias lt="ls --tree --level 2"
    alias lta="lt --all"
    alias lg="ll --git"
    alias lga="lg --all"
    alias l="lla"
    alias li="lsa"
end

# Pyenv (Python Version Manager) Initialization
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
status --is-interactive; and . (pyenv init --path | psub)
status --is-interactive; and . (pyenv init - | psub)

# Pyenv Virtualenv Initialization
status --is-interactive; and source (pyenv virtualenv-init - | psub)

# Set python as python3
# alias python python3

# fvm
alias flutter="fvm flutter"
alias dart="fvm dart"

# github
if test -z "$SSH_AUTH_SOCK"
    eval (ssh-agent -c)
    ssh-add ~/.ssh/id_ed25519
end

mise activate fish | source
