export PATH=~/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH

export MANPATH=/opt/local/share/man

export EDITOR="mate -w"
export CVSEDITOR="mate -w"
export SVNEDITOR="mate -w"

# Other useful stuff
export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export HISTCONTROL=ignoredups # Ignores dupes in the history
shopt -s checkwinsize # After each command, checks the windows size and changes lines and columns

# bash completion settings (actually, these are readline settings)
bind "set completion-ignore-case on" # note: bind is used instead of setting these in .inputrc.  This ignores case in bash completion
bind "set bell-style none" # No bell, because it's damn annoying
bind "set show-all-if-ambiguous On" # this allows you to automatically show completion without double tab-ing

export EC2_DIR=~/.ec2
export EC2_HOME=$EC2_DIR/tools
export AWS_RDS_HOME=~/.rds/tools
export AWS_IAM_HOME=~/.iam/tools
export PATH=$PATH:$EC2_HOME/bin:$AWS_RDS_HOME/bin:$AWS_IAM_HOME/bin

export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands/java_home`

if [ -f ~/.bash_completion ]; then
    . ~/.bash_completion
fi

if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_mount ]; then
    . ~/.bash_mount
fi

if [ -f ~/.bundle_exec ]; then
  . ~/.bundle_exec
fi

# This must be the last sourced script
if [ -f ~/.rvm/scripts/rvm ]; then
  . ~/.rvm/scripts/rvm
fi
