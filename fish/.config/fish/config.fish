if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Use the ayu Dark theme
fish_config theme choose "catppuccin-mocha"

# Use Vi keybindings
fish_vi_key_bindings

# Disable the fish greeting
set -U fish_greeting

fish_add_path "/home/yue/.local/bin"
fish_add_path "/home/yue/.cargo/bin"

# Tmux sessionizer.
# alias tms='tmux a -t (tmux ls | cut -d \':\' -f 1 | fzf)'
alias tmuxnew='tmux new -s (pwd)'
alias cdf='cd (find -type d | fzf)'

# Some power setting stuff
alias savepower="sudo x86_energy_perf_policy power"
alias highperf="sudo x86_energy_perf_policy performance"

# obsidian
set --export OBSIDIAN_VAULT_PATH "$HOME/Documents/obsidian-vault"

# opencode
fish_add_path $HOME/.opencode/bin
