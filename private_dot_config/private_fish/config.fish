set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

if test -d /opt/homebrew
    /opt/homebrew/bin/brew shellenv | source
end

if status is-interactive
    zoxide init fish | source
end

