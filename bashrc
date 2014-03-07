#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

source /usr/share/git/git-prompt.sh

#PS1='[\u@\h \W]\$ '

BLA='\[\033[0;30m\]' # BLACK
DGR='\[\033[1;30m\]' # DGRAY
RED='\[\033[0;31m\]' # RED
LRE='\[\033[1;31m\]' # LRED
GRE='\[\033[0;32m\]' # GREEN
LGR='\[\033[1;32m\]' # LGREEN
BRO='\[\033[0;33m\]' # BROWN
YEL='\[\033[1;33m\]' # YELLOW
BLU='\[\033[0;34m\]' # BLUE
LBL='\[\033[1;34m\]' # LBLUE
PUR='\[\033[0;35m\]' # PURPLE
LPU='\[\033[1;35m\]' # LPURPLE
CYA='\[\033[0;36m\]' # CYAN
LCY='\[\033[1;36m\]' # LCYAN
LGY='\[\033[0;37m\]' # LGRAY
WHI='\[\033[1;37m\]' # WHITE
NOR='\[\033[0m\]'    # NORMAL

function exit_status {
    if [ $? -ne 0 ]; then
        RESULT_COLOR="${RED}"
    else
        RESULT_COLOR="${GRE}"
    fi
}

function set_prompt {
    exit_status

    GIT_PS1_SHOWDIRTYSTATE=yes
#    GIT_PS1_SHOWUNTRACKEDFILES=no

    local tty=$( tty )
    tty=${tty:5}

    if [[ $( type -t __git_ps1 ) == "function" ]]; then
		git_p="\$(__git_ps1 '${LGY}-(${GRE}git:%s${LGY})')"
    fi

#    PS1="${LGY}┌[\u@\h"
#    PS1="${PS1}:${PUR}${tty}"
#    PS1="${PS1}${LGY}]"
#    PS1="${PS1}${git_p}"
#    PS1="${PS1}${LGY}-(${BLU}\w${LGY})"
#    PS1="${PS1}\n${LGY}└${RESULT_COLOR}\$ ${NOR}"

	PS1="${LGY}[${PUR}${tty}${LGY}]-(${BLU}\W${LGY})${git_p}${RESULT_COLOR} -> ${NOR}"

    PS2="${CYA}. ${NOR}"
}

PROMPT_COMMAND=set_prompt

complete -cf sudo

export EDITOR="vim"

PATH="${PATH}:/opt/android-sdk/tools:/opt/android-sdk/platform-tools"
