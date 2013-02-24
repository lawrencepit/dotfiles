
for file in exports functions bash_colors bash_completion bash_prompt bash_aliases truecrypt bundle_exec reerc; do
  file="$HOME/.$file"
  [ -e "$file" ] && source "$file"
done

# brew install grc
#source "`brew --prefix grc`/etc/grc.bashrc"

if [ -f ~/.rvm/scripts/rvm ]; then
  . ~/.rvm/scripts/rvm
fi

