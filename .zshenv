source ~/.zsh/.zshrc

## パス
export PATH=/usr/local/bin:$PATH

## 文字コード
export LANG=ja_JP.UTF-8

# pyenv enviroment
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

