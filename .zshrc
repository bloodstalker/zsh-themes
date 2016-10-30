# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="devi"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the followingi line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git svn zsh-syntax-highlighting autojump)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#auto-jump
[[ -s /home/bloodstalker/.autojump/etc/profile.d/autojump.sh ]] && source /home/bloodstalker/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias covtest="/d/home/devi/covtest"
alias speedtest="curl -o /dev/null http://speedtest.sea01.softlayer.com/downloads/test100.zip"
alias xming="open /cygdrive/c/users/bloodstalker/desktop/xming.lnk"
alias killvlc="taskkill -f -im vlc.exe"
alias devihome="cd /d/home/devi/abbatoir/zhell"
alias devihome2="cd /d/home/devi/abbatoir/zhell2"
alias devihome3="cd /d/home/devi/abbatoir/zhell3"
alias devihome4="cd /d/home/devi/abbatoir/zhell4"
alias controlsuite="open /d/home/apps/ti/controlSUITE/controlSUITE.exe"
alias killstalker="taskkill -f -im xr_3da.exe"
alias killhunter="taskkill -f -im relichunterszero.exe"
alias foad="/d/home/apps/scripts/foad.bat"
alias mutator="cd /d/home/devi/mutator"
alias remotejob="cd /d/home/devi/remote-job"
alias kill="taskkill"
alias la="ls -A"
alias zshthemes="cd /d/home/devi/zsh-themes"
alias updatetheme="cp /d/home/devi/zsh-themes/devi.zsh-theme /cygdrive/d/home/apps/.babun/cygwin/home/bloodstalker/.oh-my-zsh/themes/devi.zsh-theme"
alias updaterc="cp /d/home/devi/zsh-themes/.zshrc /d/home/apps/.babun/cygwin/home/bloodstalker/.zshrc"
alias ecpapyrus="run /d/home/devi/eclipse/papyrus/papyrus/papyrus.exe"
alias eclipse="run /d/home/devi/eclipse/eclipse-everything/eclipse.exe"
alias doomsod="run /d/home/devi/games/doom/gzdoom.exe -file SODfinal.WAD -nomusic -savedir /home/devi/games/doom/sod"
alias doompl2="run /d/home/devi/games/doom/gzdoom.exe -file PL2.WAD -nomusic -savedir /home/devi/games/doom/pl2"
alias devibox="cd /d/home/devi"
alias killholes="rm -rf /d/home/devi/abbatoir/zthepit/*"
alias ck4="run /d/home/apps/DOSBox-0.74/DOSBox.exe -userconf"
alias deluge="run /c/progra~2/deluge/deluge.exe"
alias ee="explorer ."
alias docs="cd /d/home/devi/docs"

function fixrc {
	cp /d/home/devi/zsh-themes/.zshrc /d/home/apps/.babun/cygwin/home/bloodstalker/.zshrc
	source ~/.zshrc	
}

function fixtheme {
	cp /d/home/devi/zsh-themes/devi.zsh-theme /cygdrive/d/home/apps/.babun/cygwin/home/bloodstalker/.oh-my-zsh/themes/devi.zsh-theme
	source ~/.zshrc
}

function digahole {
	globalholecounter=1
	if test "$(ls -A "/d/home/devi/abbatoir/zthepit")"; then		
		while [ 1 ]; do
			if [ -d "/d/home/devi/abbatoir/zthepit/hole$globalholecounter" ]; then
				((globalholecounter++))
			else
				break;
			fi
		done

		((globalholecounter--))

		if [ -d "/d/home/devi/abbatoir/zthepit/hole$globalholecounter" ]; then
			if test "$(ls -A "/d/home/devi/abbatoir/zthepit/hole$globalholecounter")"; then
				((globalholecounter++))
				mkdir /d/home/devi/abbatoir/zthepit/hole$globalholecounter
				cd /d/home/devi/abbatoir/zthepit/hole$globalholecounter
			else
				cd /d/home/devi/abbatoir/zthepit/hole$globalholecounter	
			fi
    	fi
	else
		mkdir /d/home/devi/abbatoir/zthepit/hole$globalholecounter
		cd /d/home/devi/abbatoir/zthepit/hole$globalholecounter
	fi
}
