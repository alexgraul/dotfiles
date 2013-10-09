export DISPLAY=:0.0
export HISTFILESIZE=30000000
export HISTSIZE=30000000
export HISTIGNORE="&:ls:[bf]g:exit:history"
export EDITOR=mvim
export JAVA_HOME=$(/usr/libexec/java_home)
export PS1='\w$(__git_ps1 "(%s)") > '
export JRUBY_HOME=$HOME/.rvm/rubies/jruby-1.7.3/

set -o vi

export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH

if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
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
    echo "⚒"
  else
    echo "»"
      fi
}
export PS1='\w$(git_prompt_info) '

################################# RVM
if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi
rvm default

git config --global alias.lg "log --color --graph --pretty=format:'%Cblue%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global core.editor "mvim -f"


VENVWRAPPER=`which virtualenvwrapper.sh`
if [ -e $VENVWRAPPER ]
then
  source $VENVWRAPPER
fi
