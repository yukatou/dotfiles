setopt transient_rprompt          # 右側まで入力がきたら時間を消す
setopt prompt_subst               # 便利なプロント
bindkey -e                        # emacsライクなキーバインド
export LANG=ja_JP.UTF-8           # 日本語環境
export EDITOR=vim                 # エディタはvim
autoload -U compinit              # 強力な補完機能
compinit -u                       # このあたりを使わないとzsh使ってる意味なし
setopt autopushd		              # cdの履歴を表示
setopt pushd_ignore_dups          # 同ディレクトリを履歴に追加しない
setopt auto_cd                    # 自動的にディレクトリ移動
setopt list_packed 		            # リストを詰めて表示
setopt list_types                 # 補完一覧ファイル種別表示

# 履歴
HISTFILE=~/.zsh_history           # historyファイル
HISTSIZE=10000                    # ファイルサイズ
SAVEHIST=10000                    # saveする量
setopt hist_ignore_dups           # 重複を記録しない
setopt hist_reduce_blanks         # スペース排除
setopt share_history              # 履歴ファイルを共有
setopt EXTENDED_HISTORY           # zshの開始終了を記録

# history 操作まわり
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# alias
alias ls="ls -aFG"
alias be="bundle exec"
alias pd="padrino"
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'


# Ctrl+wで､直前の/までを削除する｡
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# VCS settings
autoload -Uz vcs_info

# gitのみ有効にする
#zstyle ":vcs_info:*" enable git
# commitしていない変更をチェックする
zstyle ":vcs_info:git:*" check-for-changes true
# gitリポジトリに対して、変更情報とリポジトリ情報を表示する
zstyle ":vcs_info:git:*" formats "[%b]%c%u"
# gitリポジトリに対して、コンフリクトなどの情報を表示する
zstyle ":vcs_info:git:*" actionformats "[%b]%c%u<%a>"
# addしていない変更があることを示す文字列
zstyle ":vcs_info:git:*" unstagedstr "+"
# commitしていないstageがあることを示す文字列
zstyle ":vcs_info:git:*" stagedstr "*"


# git：まだpushしていないcommitあるかチェックする
my_git_info_push () {
  if [ "$(git remote 2>/dev/null)" != "" ]; then
    local head="$(git rev-parse HEAD)"
    local remote
    for remote in $(git rev-parse --remotes) ; do
      if [ "$head" = "$remote" ]; then return 0 ; fi
    done
    # pushしていないcommitがあることを示す文字列
    echo "<P>"
  fi
}

# git：stashに退避したものがあるかチェックする
my_git_info_stash () {
  if [ "$(git stash list 2>/dev/null)" != "" ]; then
    # stashがあることを示す文字列
    echo "{s}"
  fi
}

precmd() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    psvar[1]=$vcs_info_msg_0_
}

PROMPT=$'%2F%n@%m%f %3F%~%f %1v\n%# '

export PATH=/usr/local/bin:$PATH

# VBoxManage
# 起動
startvm() {
  VBoxManage startvm $1 --type=headless;
}

# 停止
stopvm() {
  VBoxManage controlvm $1 savestate
}


# rbenv
if [ -e ~/.rbenv ]; then
  eval "$(rbenv init -)"
fi

# nodebrew 
if [ -e ~/.nodebrew ]; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

# Initialization for FDK command line tools.Tue Sep 25 23:54:34 2012
FDK_EXE="/Users/yukatou/bin/FDK/Tools/osx"
PATH=${PATH}:"/Users/yukatou/bin/FDK/Tools/osx"
export PATH
export FDK_EXE
