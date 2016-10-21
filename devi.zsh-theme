# prompt style and colors based on Steve Losh's Prose theme:
# http://github.com/sjl/oh-my-zsh/blob/master/themes/prose.zsh-theme
#
# vcs_info modifications from Bart Trojanowski's zsh prompt:
# http://www.jukie.net/bart/blog/pimping-out-zsh-prompt
#
# git untracked files modification from Brian Carper:
# http://briancarper.net/blog/570/git-info-in-your-zsh-prompt

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}
PR_GIT_UPDATE=1

setopt prompt_subst

autoload -U add-zsh-hook
autoload -Uz vcs_info

#use extended color pallete if available
if [[ $TERM = *256color* || $TERM = *rxvt* ]]; then
    turquoise="%F{81}"
    orange="%F{166}"
    purple="%F{135}"
    hotpink="%F{161}"
    limegreen="%F{118}"
    lorange="%F{222}"
    batyellow="%F{226}"
    batgreen="%F{76}"
    batred="%F{88}"
    purblue="%F{69}"
    swampgreen="%F{64}"
    limblue="%F{154}"
else
    turquoise="$fg[cyan]"
    orange="$fg[yellow]"
    purple="$fg[magenta]"
    hotpink="$fg[red]"
    limegreen="$fg[green]"
    batyellow="%fg[yellow]"
    batgreen="%fg[green]"
    batred="%fg[red]"
fi

# enable VCS systems you use
zstyle ':vcs_info:*' enable git svn

# check-for-changes can be really slow.
# you should disable it, if you work with large repositories
zstyle ':vcs_info:*:prompt:*' check-for-changes true

# set formats
# %b - branchname
# %u - unstagedstr (see below)
# %c - stagedstr (see below)
# %a - action (e.g. rebase-i)
# %R - repository path
# %S - path in the repository
PR_RST="%{${reset_color}%}"
FMT_BRANCH=" on %{$turquoise%}%b%u%c${PR_RST}"
FMT_ACTION=" performing a %{$limegreen%}%a${PR_RST}"
FMT_UNSTAGED="%{$orange%} ●"
FMT_STAGED="%{$limegreen%} ●"

zstyle ':vcs_info:*:prompt:*' unstagedstr   "${FMT_UNSTAGED}"
zstyle ':vcs_info:*:prompt:*' stagedstr     "${FMT_STAGED}"
zstyle ':vcs_info:*:prompt:*' actionformats "${FMT_BRANCH}${FMT_ACTION}"
zstyle ':vcs_info:*:prompt:*' formats       "${FMT_BRANCH}"
zstyle ':vcs_info:*:prompt:*' nvcsformats   ""


function steeef_preexec {
    case "$(history $HISTCMD)" in
        *git*)
            PR_GIT_UPDATE=1
            ;;
        *svn*)
            PR_GIT_UPDATE=1
            ;;
    esac
}
add-zsh-hook preexec steeef_preexec

function steeef_chpwd {
    PR_GIT_UPDATE=1
}
add-zsh-hook chpwd steeef_chpwd

function steeef_precmd {
    if [[ -n "$PR_GIT_UPDATE" ]] ; then
        # check for untracked files or updated submodules, since vcs_info doesn't
        if [[ ! -z $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
            PR_GIT_UPDATE=1
            FMT_BRANCH="${PM_RST} on %{$turquoise%}%b%u%c%{$hotpink%} ●${PR_RST}"
        else
            FMT_BRANCH="${PM_RST} on %{$turquoise%}%b%u%c${PR_RST}"
        fi
        zstyle ':vcs_info:*:prompt:*' formats       "${FMT_BRANCH}"

        vcs_info 'prompt'
        PR_GIT_UPDATE=
    fi
}
add-zsh-hook precmd steeef_precmd

function guess_who {
    upower -e > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        os="lin"
    else
        os="win"
    fi
}
add-zsh-hook precmd guess_who

function time_function {
    $guess_who
    if [[ "$os" = "win" ]]; then
        date | gawk 'BEGIN{RS=","}END{print $2" "$3}'
    else
        date | gawk '{print $4}'
    fi
}

PROMPT=$'%{$swampgreen%}%n%{$reset_color%} on %{$purblue%}%m%{$reset_color%} in %{$limegreen%}%~%{$reset_color%} at %{$batyellow%}$(time_function)%{$reset_color%}$(ruby_prompt_info " with%{$fg[red]%} " v g "%{$reset_color%}")$vcs_info_msg_0_%{$limblue%}\n-%{$limblue%}-%{$limblue%}➜%"%{$reset_color%}%" '

function battery_charge {
    upower -e > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        batpath=$(upower -e | grep BAT0)
        batcharge=$(upower -i $batpath | grep percentage | gawk '{print $2}')
    else
        batcharge=$(wmic path win32_battery get estimatedchargeremaining | gawk 'BEGIN{RS="  \n"}{print$3}')
    fi    
    
    batfull=100
    batgood=66
    batbad=33

    if [[ $batcharge > $batgood || $batcharge = $batgood || $batcharge = $batfull ]]; then
        batcolor=$batgreen
    elif [[ $batcharge < $batgood && $batcharge > $batbad || $batcharge == $batbad ]]; then
        batcolor=$batyellow
    elif [[ $batcharge < $batbad ]]; then
        batcolor=$batred
    else
        batcolor=$purple
    fi
}
add-zsh-hook precmd battery_charge

function batcharge_printer {
    $battery_charge
    echo $batcharge
}

RPROMPT='%{$lorange%}%?%{$reset_color%}  %{$batcolor%}$(batcharge_printer)%%%{$reset_color%}'