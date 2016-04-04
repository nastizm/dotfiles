source ~/.zsh/.zshrc

## パス
export PATH=/usr/local/bin:$PATH
export GOPATH=/Users/kensuke.nakada

## 文字コード
export LANG=ja_JP.UTF-8

# pyenv enviroment
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH="/usr/local/heroku/bin:$PATH"
# homebrew
export HOMEBREW_CACHE=~/Library/Caches/Homebrew

