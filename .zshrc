# Oh-My-Zsh 설정
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# 플러그인 설정
plugins=(
  autojump
  git
  zsh-autosuggestions
  fzf
  fzf-tab
)

source $ZSH/oh-my-zsh.sh

# Python alias
alias python=python3.11
alias pip=pip3.11
alias ws=webstorm

# IntelliJ 터미널용 테마 설정
if [[ $__INTELLIJ_COMMAND_HISTFILE__ ]]; then
  ZSH_THEME="robbyrussell"
else
  ZSH_THEME="powerlevel10k/powerlevel10k"
fi

# Powerlevel10k 설정
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# zsh-syntax-highlighting, fzf 사용자 스크립트
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/dotfiles/fzf-script.sh

# 기본 alias
export BAT_THEME="Visual Studio Dark+"
alias cat='bat --paging=never'
alias ls='lsd'
alias ll='ls -alhF'
alias lrt='ls -arlth'

# IntelliJ 경로 (터미널에서 실행될 수 있도록)
export PATH="/Application/IntelliJ IDEA.app/Contents/MacOS:$PATH"

# fzf 미리보기 설정
export FZF_DEFAULT_OPTS="--preview \"git diff --color=always {} | less -R\""

# 사용자 함수에도 강조 표시 적용
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan,bold'

