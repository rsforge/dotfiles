set -Ua fish_user_paths /home/riverwc/.cargo/bin

set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

#--------------------------------------------------
# Load Fish theme
#--------------------------------------------------
source ~/.config/fish/conf.d/tokyonight-moon.fish

#--------------------------------------------------
# Init Starship - (shell prompt)
#--------------------------------------------------
starship init fish | source

#--------------------------------------------------
# Init Zoxide (improved cd)
#--------------------------------------------------
zoxide init fish | source
