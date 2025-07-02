function gb --wraps='git branch --sort=committerdate --verbose' --description 'alias gb=git branch --sort=committerdate --verbose'
  git branch --sort=committerdate --verbose $argv
        
end
