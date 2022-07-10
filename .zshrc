########################################
# core
########################################

export PATH=$HOME/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/user/local/opt/mysql@5.7/bin:$PATH
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

########################################
# commands
########################################

# cd+ls 
chpwd() {
  dotfiles_dir="$HOME/dotfiles"
  if [[ $(pwd) = $dotfiles_dir ]]; then
    ls -aFG
  else
    ls -FG
  fi
}

function cdroot() {
  if [ $(which gitroot) ]; then
    RESULT=$(gitroot)
    STATUS=$?
    if [ $STATUS -eq 0 ]; then
      cd $RESULT
    else
      echo $RESULT
    fi
  else
    echo 'cdroot: command gitroot does not exist'
  fi
}


########################################
# prompt
########################################

RPROMPT=''

# vcs_info document
# https://zsh.sourceforge.io/Doc/Release/User-Contributions.html#Configuration-1
# vcs_info examples
# https://github.com/zsh-users/zsh/blob/f9e9dce5443f323b340303596406f9d3ce11d23a/Misc/vcs_info-examples#L155-L170

autoload -Uz vcs_info
setopt prompt_subst

# %c, %u を有効化
zstyle ':vcs_info:git:*' check-for-changes true
# 未コミットのファイルがあれば表示
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}+"
# 未ステージングのファイルがあれば表示
zstyle ':vcs_info:git:*' unstagedstr "%F{red}!"
# フォーマット %c: 見コミッt, %u: 未ステージング, %b: ブランチ名
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"

precmd () { vcs_info }
# NOTE: ダブルクォートで囲むと.zshrc読み込み時に変数が展開されるので、
# PROMPTはプロンプト表示のたびに展開されるようシングルクォートで囲む
PROMPT='
[%F{cyan}%~%f] ${vcs_info_msg_0_}
%B%(?,%F{green}:)%f,%F{yellow}:(%f)%b '

# 未追跡ファイルがあれば表示
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked(){
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
    git status --porcelain | grep '??' &> /dev/null ; then
      hook_com[staged]+='%F{red}?'
  fi
}
########################################
# completion
########################################

autoload -U compinit
compinit

zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'


########################################
# alias
########################################

## core

alias ls='ls -FG'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'

# utility

alias showcolors='for c in {000..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo;done;echo'
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs &'
alias vi='nvim'
alias python='python3'

# dotfiles

alias cdd="cd $HOME/dotfiles"
alias vz="vi $HOME/dotfiles/.zshrc"
alias sz="source $HOME/dotfiles/.zshrc"
alias vv="vi $HOME/dotfiles/vim/.vimrc"

# git

alias gs="git status"

########################################
# colors
########################################

export LSCOLORS=GxFxcxdxCxegedabagacad


########################################
# others
########################################
#

# Disable glob expansion
setopt nonomatch

# Added by fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/yuta/.sdkman"
[[ -s "/Users/yuta/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/yuta/.sdkman/bin/sdkman-init.sh"
