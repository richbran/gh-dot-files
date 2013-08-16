case $- in
*i*)    # interactive shell
	PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 30 ]; then CurDir=${DIR:0:12}...${DIR:${#DIR}-15}; else CurDir=$DIR; fi'
        PROMPT_COMMAND="$PROMPT_COMMAND; history -a;"

	# make bash autocomplete with up arrow
	bind '"\e[A":history-search-backward'
	bind '"\e[B":history-search-forward'

	# make tab cycle through commands instead of listing
	bind '"\t":menu-complete'
	bind "set completion-ignore-case on"

	# show current directory on the bash prompt
	PS1='\[\e[1;32m\]\u@\H:\[\e[m\e[1;35m\]\w\[\e[m\]$'
	case "$TERM" in
	xterm*|rxvt*)
	    PS1="\[\e]0;${USER}@${HOSTNAME}: ${PWD}\007\]$PS1"
	    ;;
	*)
	    ;;
	esac
	export PS1;;
*)
	;;
esac

# Automatically correct misspelled directory names
shopt -s cdspell

# Enable extended shell globbing
shopt -s extglob

# Get piping commands to be more informative
set -o pipefail

# Provide for easier combination of mkdir and cd
# See
# http://www.thegeekstuff.com/2008/10/6-awesome-linux-cd-command-hacks-productivity-tip3-for-geeks/
# for inspiration
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
