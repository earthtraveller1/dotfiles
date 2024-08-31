if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Use the ayu Dark theme
fish_config theme choose "ayu Dark"

# Use Vi keybindings
fish_vi_key_bindings

# Disable the fish greeting
set fish_greeting

starship init fish | source
fish_add_path "/home/yue/.local/bin"
fish_add_path "/home/yue/.cargo/bin"

set -e SSH_ASKPASS

# Ensure that ssh-agent is running
ssh-agent -c | source

# Tmux sessionizer.
# alias tms='tmux a -t (tmux ls | cut -d \':\' -f 1 | fzf)'
alias tmuxnew='tmux new -s (pwd)'
alias cdf='cd (find -type d | fzf)'

# obsidian
set --export OBSIDIAN_VAULT_PATH "$HOME/Documents/obsidian-vault"

# clear the screen
clear

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/yue/.ghcup/bin $PATH # ghcup-env
# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME "/home/yue/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
