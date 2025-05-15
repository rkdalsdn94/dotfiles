[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf 기본 설정
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# '$command ** + tab' 했을 때 바인딩
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig  {}'                   "$@" ;;
    *)            fzf "$@" ;;
  esac
}

# brew install fd 를 통해 fd가 설치되어 있어야 한다.
FD_OPTION="--follow --exclude .git --exclude node_modules"

# .git 파일 제외
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'

# FZF와 맥 CTRL, ALT 등 키 바인딩
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"

# bat을 통해 fzf preview 더 보기 좋게 만들기
# alias pre="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
# alias pre="fzf --preview 'bat --style=plain --color=always {}' --preview-window=right:70%:wrap"
alias pre="fzf --preview 'bat --style=plain --color=always {}' --preview-window=right:70%:nowrap --bind 'alt-w:toggle-preview-wrap'"

###########################################################################################
# https://medium.com/harrythegreat/fzf로-커스터마이징하기-cc9e8fee0fb
# (fd, lsd, bat, ripgrep) brew 패키지 필요
# sdt 바인딩 - 폴더 depth 구조 출력, enter로 해당 폴더 이동 가능 (lsd brew 패키지가 필요)
function sdt() {
  local dir
  dir=$(fd --type d --hidden --follow --exclude .git 2>/dev/null | fzf\
  --header 'Search In Directory'\
  --border\
  --height 80%\
  --extended\
  --ansi\
  --reverse\
  --cycle\
  --header 'Search Directory'\
  --bind 'alt-p:preview-up,alt-n:preview-down'\
  --bind 'ctrl-u:half-page-up,ctrl-d:half-page-down'\
  --bind "alt-s:execute(lsd {})+abort"\
  --bind '?:toggle-preview,alt-w:toggle-preview-wrap'\
  --bind 'alt-v:execute($EDITOR {$FZF_PATH_LOC} >/dev/tty </dev/tty)'\
  --preview 'lsd --color=always --tree --depth=2  {} | head -200 2>/dev/null'\
  --preview-window=right:50%) && cd "$dir"
}

# --------------------------------------
# Warp + Powerlevel10k + fzf 최적화
# --------------------------------------

# 🔧 alias 설정 (Warp에서 빠르게)
alias e='nvim'
alias zshconfig='nvim ~/.zshrc'
alias p10kconfig='nvim ~/.p10k.zsh'
alias reload!='source ~/.zshrc'
alias hist='history | fzf --tac'

# 🧠 fcd - 디렉토리 빠르게 이동
function fcd() {
  cd "$(fd --type d --hidden --exclude .git | fzf --height=40% --reverse --preview 'tree -C {} | head -200')" || return
}

# 🧹 fkill - 실행 중인 프로세스 종료
function fkill() {
  ps -ef | sed 1d | fzf --multi | awk '{print $2}' | xargs kill -9
}

# 🔍 fif - 파일 내 문자열 검색
function fif() {
  if [ -z "$1" ]; then echo "🔍 검색어를 입력해주세요."; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf \
    --header "🔍 '$1' 가 포함된 파일 찾기" \
    --preview "bat --style=numbers --color=always {} | rg --ignore-case --pretty --context 10 '$1'" \
    --bind 'enter:execute(nvim {})+abort'
}

# 🌳 sdt - 디렉토리 구조 탐색 후 이동
function sdt() {
  local dir
  dir=$(fd --type d --hidden --follow --exclude .git 2>/dev/null | fzf \
    --header '📁 디렉토리 찾기 (sdt)' \
    --height 80% --reverse --ansi --cycle --border \
    --bind 'alt-p:preview-up,alt-n:preview-down' \
    --bind 'ctrl-u:half-page-up,ctrl-d:half-page-down' \
    --bind 'alt-s:execute(lsd {})+abort' \
    --bind '?:toggle-preview,alt-w:toggle-preview-wrap' \
    --bind 'alt-v:execute($EDITOR {$FZF_PATH_LOC} >/dev/tty </dev/tty)' \
    --preview 'lsd --color=always --tree --depth=2 {} | head -200 2>/dev/null' \
    --preview-window=right:50%) && cd "$dir"
}

