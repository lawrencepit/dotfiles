
for file in exports functions bash_completion bash_prompt bash_aliases bash_mount bundle_exec reerc; do
  file="$HOME/.$file"
  [ -e "$file" ] && source "$file"
done

# This must be the last sourced script
if [ -f ~/.rvm/scripts/rvm ]; then
  . ~/.rvm/scripts/rvm
fi

# Kick of executing .rvmrc
cd .. ; cd -
