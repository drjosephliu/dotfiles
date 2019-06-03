alias ll='ls -hartl'
alias g='grep -i'
alias get='curl -OL'
alias tmux="TERM=screen-256color-bce tmux"
source ~/.git-prompt.sh
PS1='[\W$(__git_ps1 " (%s)")]\$ '
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

source ~/.git-completion.bash
source ~/.rvm/scripts/rvm

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/Joseph/google-cloud-sdk/path.bash.inc' ]; then source '/Users/Joseph/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/Joseph/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/Joseph/google-cloud-sdk/completion.bash.inc'; fi


export PATH=/Users/Joseph/google-cloud-sdk/bin:/Users/Joseph/.rvm/gems/ruby-2.3.1/bin:/Users/Joseph/.rvm/gems/ruby-2.3.1@global/bin:/Users/Joseph/.rvm/rubies/ruby-2.3.1/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/MacGPG2/bin:/Applications/Postgres.app/Contents/Versions/latest/bin:/Users/Joseph/.rvm/bin:/Users/Joseph/workspace/mooc/nand2tetris/tools:/Users/Joseph/bin

export GOOGLE_APPLICATION_CREDENTIALS='/Users/Joseph/workspace/chatbots/dr-diagnosis/DiagnosisTest-credentials.json'

export DASHBOT_API_KEY='paBKjGP21UGM92mjkCsynRrWfvn5fkRM3A2bnasO'

