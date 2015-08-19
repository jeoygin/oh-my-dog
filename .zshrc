# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# robbyrussell, amuse, blinks, ys
ZSH_THEME="ys"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby autojump mvn history history-substring-search)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

source ~/.zsh_aliases

[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh

export LANG=en_US.UTF8
export LC_ALL=en_US.UTF8

export JAVA_HOME=/opt/develop/java/jdk
export CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

export M2_HOME=/opt/develop/maven/3.1.1

export SCALA_HOME=/opt/develop/scala/current

export SBT_HOME=/opt/develop/sbt

export ANDROID_HOME=/opt/develop/android/sdk
export ANDROID_NDK_HOME=/opt/develop/android/ndk

export GOPATH=~/go

export HADOOP_PREFIX=/opt/devops/hadoop
export YARN_CONF_DIR=/opt/devops/hadoop
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_PREFIX/lib/native
export HADOOP_OPTS="-Djava.library.path=$HADOOP_PREFIX/lib"

# The next line updates PATH for the Google Cloud SDK.
source '/home/jeoygin/google-cloud-sdk/path.zsh.inc'

# The next line enables bash completion for gcloud.
source '/home/jeoygin/google-cloud-sdk/completion.zsh.inc'

alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'

export PATH=$HOME/.rvm/bin:$JAVA_HOME/bin:$M2_HOME/bin:/opt/develop/jetbrains/idea-IU/bin:/opt/develop/jetbrains/WebStorm/bin:$SCALA_HOME/bin:$SBT_HOME/bin:$ANDROID_HOME/tools:$ANDROID_NDK_HOME:~/.cabal/bin:~/go/bin:$PATH

export TERM="xterm-256color"

setopt CORRECT

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/home/jeoygin/.gvm/bin/gvm-init.sh" ]] && source "/home/jeoygin/.gvm/bin/gvm-init.sh"
