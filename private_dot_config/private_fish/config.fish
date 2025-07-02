set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

if status is-interactive
    zoxide init fish | source
end
