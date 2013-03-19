export DISPLAY=:0.0
export HISTFILESIZE=30000000
export HISTSIZE=30000000
export HISTIGNORE="&:ls:[bf]g:exit:history"
export EDITOR=mvim
export PS1='\w$(__git_ps1 "(%s)") > '

set -o vi

export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/Users/alex/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
. `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

reset() { echo -e \\033c; }

################################# Prompt
git_prompt_info() {
  branch_prompt=$(__git_ps1)
    if [ -n "$branch_prompt" ]; then
      status_icon=$(git_status)
        echo $branch_prompt$status_icon
    else
      echo "$"
        fi
}

git_status() {
  if current_git_status=$(git status | grep 'added to commit' 2> /dev/null); then
    echo "⚡"
  else
    echo "$"
      fi
}
export PS1='\w$(git_prompt_info) '

################################# RVM
if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi
rvm default
