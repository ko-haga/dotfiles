export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/opt/local/bin:/opt/local/sbin/:~/bin:$PATH

# osx alias
alias pbc='pbcopy'

# Terminal Colorの設定
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

##Java7
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home
# export JAVA_HOME=/Library/Java/Home
export PATH=$JAVA_HOME/bin:$PATH
# デフォルトエンコーディングSJISをUTF-8へ
export _JAVA_OPTIONS="-Dfile.encoding=UTF-8"

# man path
MANPATH=/usr/local/man:$MANPATH
export MANPATH
INFOPATH=/usr/local/info:$INFOPATH
export INFOPATH

# Mysql
export MYSQL_HOME=/usr/local
export PATH=$MYSQL_HOME/bin:$PATH

# TERM
export TERM=xterm-256color

# gcp
export PATH=${0:A:h}/bin:$PATH

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init - --no-rehash)"

# ssh
export SSHDIR="$HOME/.ssh"

function ssh_add_list(){
    if [ `ssh-add -l | grep "RSA" | wc -l` -eq 0 ]; then
        find ${SSHDIR} -name "github_rsa" | xargs ssh-add > /dev/null 2>&1
        find ${SSHDIR} -name "id_rsa_pz" | xargs ssh-add > /dev/null 2>&1
        echo "ssh-add を実行しました"
    fi
}
ssh_add_list

# adb
export PATH="/Applications/android_sdk/sdk/platform-tools:$PATH"

# production
export ENV=localhost

# neovim
export XDG_CONFIG_HOME=$HOME/.config

# nodebrew
# export PATH="$HOME/.nodebrew/current/bin:$PATH"
