# Homebrew 환경 변수 (Apple Silicon 기준)
eval "$(/opt/homebrew/bin/brew shellenv)"

# NVM(Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

# SDKMAN(Java/Gradle 등 버전 관리 도구)
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# Android 개발 환경
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# OpenJDK
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# React Native 전용 JAVA_HOME
export REACT_JAVA="$HOME/.sdkman/candidates/java/11.0.23-zulu"

export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"
