source ~/.zsh/.zshrc

## パス
export PATH=/usr/local/bin:$PATH
export GOPATH=/Users/kensuke.nakada

## 文字コード
export LANG=ja_JP.UTF-8

# pyenv enviroment
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# homebrew
export HOMEBREW_CACHE=~/Library/Caches/Homebrew

