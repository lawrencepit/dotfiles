alias wget='curl -L -O'

# Shortcuts
alias d="cd ~/Dropbox"
alias p="cd ~/projects"
alias m="mate ."

alias b='bundle exec bash'
alias be='bundle exec'
alias gems='cd $GEM_HOME'

alias g='git'
alias ga='git add'
alias gb='git branch'
alias gba='git branch -a'
alias gca='git commit -a -v'
alias gd='git diff | mate'
alias gdc='git diff --cached | mate'
alias gxx='git dlcs'
alias gs='git status'
alias gl='git pull'
alias gp='git push'
alias gc='git checkout'
alias gf='git fetch'
alias gcl='git config --list'
alias gundo="git push -f origin HEAD^:master"

alias gk='gitk --all'
alias gx='gitx --all'

alias hg='history | grep'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ls='ls -G'
alias ll='ls -lah'
alias lx='ls -X'
alias ld='ls -l | grep "^d"'
alias pg='ps aux | grep'

# Rails shortcuts
alias rc='rails c'
alias rs='unicorn_rails'
alias rdb='rails db'
alias mt='reetest ; bundle exec rake db:migrate:reset ; bundle exec rake spec ; reedev'
alias rt='reetest ; bundle exec rake RAILS_ENV=test spec > log/test.stdout.log ; reedev'
alias rq='reetest ; bundle exec rake cucumber > log/cucumber.stdout.log ; reedev'
alias tf='tail -n 1000 -f log/development.log'
alias tt='tail -n 1000 -f log/test.stdout.log'

# Backup all mysql databases
# Use --single-transaction when using InnoDB only to minimize locking time.
alias mysqldumpall='SQLDUMPFILENAME=mysql.all.`date +"%Y%m%d"`.sql ; mysqldump --user=root --password= --default-character-set=utf8 --all-databases -r ~/${SQLDUMPFILENAME} ; gzip ~/${SQLDUMPFILENAME}'

alias gi='grep -i'  #case insensitive grep
alias f='find . -iname'
alias ducks='du -cks * | sort -rn|head -11' # Lists the size of all the folders and files
alias top='top -o cpu'
alias systail='tail -f /var/log/system.log'
alias mailtail='tail -f /var/log/mail.log'

alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

alias ssha='eval `ssh-agent` ; ssh-add'

alias memstat='echo stats | nc 127.0.0.1 11211'
alias memflush='echo flush_all | nc 127.0.0.1 11211'

alias ch='rm ~/.bash_history ; history -c ; clear'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# File size
alias fs="stat -f \"%z bytes\""

# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

# Disable/Enable Spotlight server
alias spotsoff="sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist"
alias spotson="sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist"

# Disable/Enable Spotlight index
alias spotoff="sudo mdutil -a -i off"
alias spoton="sudo mdutil -a -i on"

for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do alias "$method"="curl -X $method -H \"Accept: application/json\""; done

# http://mikeferrier.ca/2011/04/04/setting-up-wildcard-dns-on-localhost-domains-on-osx/
# see /var/named
alias checkdns='sudo named-checkconf /etc/named.conf ; sudo named-checkzone local /var/named/local.zone'
alias reloaddns='sudo rndc -p 54 reload ; dscacheutil -flushcache ; cleardns'
alias resolvers='scutil --dns'

