# ghcup-env
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
test -f /home/teawhydee/.ghcup/env ; and set -gx PATH $HOME/.cabal/bin /home/teawhydee/.ghcup/bin $PATH

set EDITOR nvim

### "bat" as manpager
#set -x MANPAGER "sh -c 'col -bx | bat -l man -p'" 

set STARSHIP_CONFIG ~/.config/starship.toml
starship init fish | source

function on_pwd --on-variable PWD
    if [ ! "$fish_private_mode" ]
        if [ "$(pwd | head -c19)" = "/home/tea/encrypted" ];
            echo privated; set -g fish_private_mode yes
        end
    end
end
