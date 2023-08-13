if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Use the ayu Dark theme
fish_config theme choose "ayu Dark"

# Disable the fish greeting
set fish_greeting

starship init fish | source
fish_add_path "/home/yue/.local/bin"
fish_add_path "/home/yue/.cargo/bin"

fish_add_path "/home/yue/programs/emsdk"
fish_add_path "/home/yue/programs/emsdk/upstream/emscripten"

# Tmux sessionizer.
# alias tms='tmux a -t (tmux ls | cut -d \':\' -f 1 | fzf)'
alias tmuxnew='tmux new -s (pwd)'
alias cdf='cd (find -type d | fzf)'

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/yue/.ghcup/bin $PATH # ghcup-env

# opam configuration
source /home/yue/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
