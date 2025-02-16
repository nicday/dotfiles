

alias aliases="cat ~/.bash/*alias* | grep alias | sort | sed -e \"s/^alias\ //\" | column -t -s'='"
alias bx="bundle exec"
alias dotf="cd ~/dotfiles"
alias v="nvim"
alias ls="ls -al"
alias ..="cd .."
alias ...="cd ../.."

alias whatsmyip='curl -s https://am.i.mullvad.net/json | jq'

# Git
alias g='git'
alias gbd='git branch -d'
alias gco='git checkout'
alias gd='git diff'
alias ggpull='git pull origin $(git_current_branch)'
alias gfp='git push origin $(git_current_branch) --force-with-lease'
alias glog='git log --oneline'
alias gp='git push origin $(git_current_branch)'
alias grc="git rebase --continue"
alias grhh='git reset HEAD --hard'
alias grim="git rebase -i main"
alias grm="git rebase main"
alias grx="git rebase --abort"
alias gst='git status'
alias gsta='git stash'
alias gstp='git stash pop'
