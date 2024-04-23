# Logging Script
# You can find the output in /root/logs/ in a file named <year-month-date_hour:minute:second>.log
if [[ ${SHLVL} -le 1 ]]; then
        echo "Initiating Logging Script..."
        # Make /root/logs/ folder if it doesn't exist
        mkdir -p /root/logs
        # Set path for logs
        LOG_PATH=/root/logs/
        # Log entire session
        script $LOG_PATH$(date +%y-%m-%d_%H:%M:%S).log
        # Mount shared folders
        #/home/kali/Desktop/mount-shared-folders.sh
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Keep prompt clock updated
TMOUT=1
TRAPALRM() { zle reset-prompt }

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME="mh"
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(git-extras tmux dirhistory python pip)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
zsh-autosuggestions
zsh-syntax-highlighting
git-extras
tmux
history
dirhistory
python
pip)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ipx="curl -s http://ipinfo.io/ip"
alias sapgui="/opt/SAPClients/SAPGUI7.70rev1/bin/guilogon"
alias sniffle="python3 /usr/share/sniffle.py"
alias cl="usr/bin/clear"

setopt interactivecomments
setopt ignoreeof
setopt correctall
setopt globdots
source /home/kali/.aliases
source /home/kali/.xinitrc

#older_prompt
#PROMPT=${debian_chroot:+($debian_chroot)}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%B%F{%(#.red.blue)}%b[%t]:%B%n@%m%F{reset}:%B%F{%(#.green)}%1~%b%F{reset}%(#.#.$)

#newer_prompt
#PROMPT=${debian_chroot:+($debian_chroot)}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%B%F{%(#.white)}[%t]%b%B%F:%B%F{%(#.magenta)}%B%n%F{reset}%B%F:%B%F{%(#.white)}%1~%b%F{reset}%B%F%(#.#.$)%b

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#pyenv stuff
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

alias sgn='sudo docker run -it -v /tmp/:/tmp/ egee/sgn'
alias madspray="/root/.pyenv/versions/3.10.6/bin/python /mnt/hgfs/Exclusions/tools/madspray/MadSpray.py"
# Go path
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

#VirusTotal API key (used for Sublist3r)
# VirusTotal
if [[ -f "/root/.api_tokens/vt_apikey" ]]; then
    export VT_APIKEY="$(cat /root/.api_tokens/vt_apikey 2> /dev/null)"
fi

# Set arrow keys for zsh history
bindkey "$key[Up]" up-line-or-search
bindkey "$key[Down]" down-line-or-search
