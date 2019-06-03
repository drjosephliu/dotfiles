alias ll='ls -hartl'
alias g='grep -i'
alias get='curl -OL'
alias tmux="TERM=screen-256color-bce tmux"
source ~/.git-prompt.sh
PS1='[\W$(__git_ps1 " (%s)")]\$ '
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
