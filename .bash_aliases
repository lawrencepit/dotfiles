alias gems='cd $GEM_HOME'

alias b='bundle exec bash'
alias be='bundle exec'

alias g='git'
alias ga='git add'
alias gb='git branch'
alias gba='git branch -a'
alias gca='git commit -a -v'
alias gd='git diff | mate'
alias gdc='git diff --cached | mate'
alias gs='git status'
alias gl='git pull'
alias gp='git push'
alias gk='gitk --all'
alias gx='gitx --all'
alias gc='git checkout'
alias gf='git fetch'
alias gcl='git config --list'

alias hg='history | grep'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ls='ls -G' 
alias ll='ls -lah'

alias sc='script/console'
alias ss='script/server'
alias db='script/dbconsole'
alias tf='tail -f log/development.log'

alias g='grep -i'  #case insensitive grep
alias f='find . -iname'
alias ducks='du -cks * | sort -rn|head -11' # Lists the size of all the folders and files
alias top='top -o cpu'
alias systail='tail -f /var/log/system.log'

alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

alias ssha='eval `ssh-agent` ; ssh-add'

function sp() {
  export RUBY_HEAP_MIN_SLOTS=1000000
  export RUBY_HEAP_FREE_MIN=500000
  export RUBY_HEAP_SLOTS_INCREMENT=1000000
  export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
  export RUBY_GC_MALLOC_LIMIT=1000000000
}

