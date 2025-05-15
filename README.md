# 🛠️ macOS dotfiles for Warp + Powerlevel10k + fzf

이 저장소는 macOS에서 개발 환경을 일관되게 재현할 수 있도록 구성한 개인 dotfiles입니다. \
`Warp 터미널` + `Powerlevel10k` + `fzf` 기반, `setup.sh` 실행만으로 모든 구성을 자동으로 적용할 수 있습니다. \
[gitconfig](https://github.com/rkdalsdn94/dotfiles/blob/main/.gitconfig)에서 [user] 부분은 사용자 설정에 맞춰야 합니다.

## 📁 구성 파일

| 파일명 | 설명 |
|--------|------|
| `.zshrc` | Zsh 설정, 플러그인 및 alias, Powerlevel10k, fzf 설정 포함 |
| `.zprofile` | 로그인 시 PATH 설정용 |
| `.p10k.zsh` | Powerlevel10k 테마 설정 |
| `.fzf.zsh` | fzf 초기화 설정 |
| `fzf-script.sh` | fzf 사용자 정의 함수 모음 (`fcd`, `fkill`, `sdt`, `fif`, `pre` 등) |
| `fzf-git.sh` | Git 연동 fzf 명령어 커스터마이징 (브랜치, 태그, 해시 선택 등) |
| `.gitconfig` | Git 글로벌 설정 |
| `.gitignore_global` | Git 글로벌 ignore 목록 |
| `.gitmessage.txt` | Git 커밋 메시지 템플릿 |
| `.ideavimrc` | IntelliJ IDEA에서 사용할 Vim 설정 |
| `.vimrc` | 기본 Vim 설정 |
| `Brewfile` | 사용 중인 Homebrew 패키지 리스트 |
| `setup.sh` | 최초 설치 및 심볼릭 링크 생성 스크립트 |
| `intellij-java-google-style.xml` | Google Java 스타일 가이드 설정 (IntelliJ용) |

## ⚙️ 설치 방법

# 저장소 클론
git clone https://github.com/rkdalsdn94/dotfiles.git

# 설치 스크립트 실행
cd ~/dotfiles
bash setup.sh

> 주의: 기존의 .zshrc 등 설정 파일이 있다면 백업 후 실행하세요.

## 🌈 주요 기능

- 🧑‍💻 Warp + Powerlevel10k 기반 UI
- 🔍 fzf 명령어 자동 완성 및 미리보기 기능 (파일, git, 디렉토리 등)
- ⚡ 빠른 탐색 alias (fcd, fkill, pre, sdt, fif 등)
- 🐙 git a, git cm, git stash, git bb, git l 등 강력한 Git alias
- 🛠️ 자동 설치 가능한 Homebrew 패키지 (brew bundle 기반)

## 📦 의존성

아래 패키지는 Homebrew로 설치되며 setup.sh 실행 시 자동 처리됩니다.

- zsh, oh-my-zsh, powerlevel10k, fzf, fd, bat, lsd, ripgrep, zsh-syntax-highlighting, autojump, nvm, rbenv, sdkman

## 💾 백업 / 복원

### 백업
brew bundle dump --file=~/dotfiles/Brewfile --force

### 복원
cd ~/dotfiles
brew bundle --file=Brewfile

## 📎 기타

- Warp 환경 설정은 별도 GUI에서 Nerd Font 및 Shell 설정을 직접 변경해주세요.
