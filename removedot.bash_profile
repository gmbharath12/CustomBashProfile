function color_my_prompt {
   local __user_and_host="\[\033[01;32m\]\u@\h"
   local __cur_location="\[\033[01;34m\]\w"
   local __git_branch_color="\[\033[31m\]"
   #local __git_branch="\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`"
   local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
   local __prompt_tail="\[\033[35m\]$"
   local __last_color="\[\033[00m\]"
   export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
   export CLICOLOR=1
   export LSCOLORS=ExFxBxDxCxegedabagacad
   export NVM_DIR=~/.nvm
   source $(brew --prefix nvm)/nvm.sh
   alias ls='ls -GFh'
}
color_my_prompt

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
