##################################################
# Functions
##################################################

# cd後に実行されるhook関数
chpwd() {
  ls -FG
}

# Gitリポジトリのルートに移動する
# 要件：gitrootがインストールされていること
cdroot() {
  local -r git_root=$(gitroot)
  if [[ -z $git_root ]]; then
    echo "cdroot: you are not in a git repository." >&2
    return 1
  fi
  cd $git_root || return 1
}

##################################################
# Aliases
##################################################

alias vi='nvim'

alias ls='ls -FG'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'

alias vz="nvim $XDG_CONFIG_HOME/zsh/.zshrc"
alias sz="source $XDG_CONFIG_HOME/zsh/.zshrc"

##################################################
# Third Party Applications
##################################################

# GHCUP
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

# Volta 
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Starship
eval "$(starship init zsh)"

# Sheldon
eval "$(sheldon source)"

# Oh My Zsh
export ZSH="$HOME/.local/share/sheldon/repos/github.com/ohmyzsh/ohmyzsh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
