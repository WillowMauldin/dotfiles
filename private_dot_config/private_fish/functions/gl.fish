function gl --wraps='git log --oneline --graph --decorate --first-parent' --description 'alias gl=git log --oneline --graph --decorate --first-parent'
  git log --oneline --graph --decorate --first-parent $argv
        
end
