#!/bin/bash
# dotfiles/setup.sh
# ⚙️ Mac 초기 설정 자동화 스크립트
# 사용법: 터미널에서 ./setup.sh 실행

set -e

### 0. dotfiles 디렉토리 경로 확인
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo ">>> dotfiles 위치: $DOTFILES_DIR"

### 1. Homebrew 설치 (없을 경우)
echo ">>> Homebrew 설치 확인..."
if ! command -v brew &> /dev/null; then
  echo ">>> Homebrew 설치 중..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo ">>> Homebrew 이미 설치됨 ✅"
fi

### 2. Brewfile 기반 패키지 복원 (이전 맥에서 dump 해둔 경우)
echo ">>> Brewfile 패키지 설치 중..."
brew bundle --file="$DOTFILES_DIR/Brewfile" || true

### 3. Nerd Font 설치 (혹시 빠졌을 경우)
brew tap homebrew/cask-fonts || true
brew install --cask font-fira-code-nerd-font || true

### 4. dotfiles 심볼릭 링크 생성
echo ">>> 심볼릭 링크 생성..."
ln -sf "$DOTFILES_DIR/.zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/.zprofile" ~/.zprofile
ln -sf "$DOTFILES_DIR/.p10k.zsh" ~/.p10k.zsh
ln -sf "$DOTFILES_DIR/.gitconfig" ~/.gitconfig
ln -sf "$DOTFILES_DIR/.gitignore_global" ~/.gitignore_global
ln -sf "$DOTFILES_DIR/.gitmessage.txt" ~/.gitmessage.txt
ln -sf "$DOTFILES_DIR/.vimrc" ~/.vimrc
ln -sf "$DOTFILES_DIR/.ideavimrc" ~/.ideavimrc
ln -sf "$DOTFILES_DIR/.fzf.zsh" ~/.fzf.zsh

### 5. 완료 안내
echo -e "\n✅ 모든 설정이 완료되었습니다. 새 터미널을 열거나 아래 명령으로 반영하세요:"
echo "  exec zsh"
