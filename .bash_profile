alias ll='ls -hartl'
alias g='grep -i'
alias get='curl -OL'
alias tmux="TERM=screen-256color-bce tmux"
source ~/.git-prompt.sh
PS1='[\W$(__git_ps1 " (%s)")]\$ '
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/opt/node@8/bin:$PATH"
# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --folow --glob "!.git/*"'

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
    # if not found in /usr/local/etc, try the brew --prefix location
    [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
        . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
}
