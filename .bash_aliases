# Zack Sargent
# Bash aliases

alias poweroff="echo dont do it"

# some more ls aliases
alias ls='ls --color'
alias lls='ls --color'
alias s='ls --color'
alias lsn='ls --color=no'
alias ll='ls -alF'
alias lsa='ls -a'
alias la='ls -A'
alias l='ls -CF'

alias py=python3
alias python=python3
alias pyshell=ptpython
alias apt='sudo apt-get'
alias win='cd "/mnt/c/Users/e22-sargentzw/OneDrive - Elder High School"'
alias su=sudo

# Curl Commands
alias colortest='curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/ | bash'
alias networktest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'

# let's get meta
alias aliases='vim ~/.bash_aliases && . ~/.bash_aliases'

# tetris
alias netris="ssh netris.rocketnine.space"

# Make a directory and then cd into that directory
mkcd () {
	mkdir -p "$1";
	cd "$1"
}

# Kill tmux
alias oops='tmux kill-server'
alias diewindow='tmux kill-window -t'
alias diewin='tmux kill-window -t'

# No more cd ../../../..
alias ..s='cd ..; ls'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# youtube-dl
alias ytdl=youtube-dl
alias ytvid='youtube-dl -o "%(title)s.%(ext)s"'
alias ytmp3='youtube-dl --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s"'
alias ytplaylist='youtube-dl --extract-audio --ignore-errors --audio-format mp3 -o "%(title)s.%(ext)s"'

# convert * to mp3
alias mkv2mp3='find . -type f -name "*.mkv" -exec bash -c '"'"'FILE="$1"; ffmpeg -i "${FILE}" -vn -c:a libmp3lame -y "${FILE%.mkv}.mp3";'"'"' _ '"'"'{}'"'"' \;'
alias webm2mp3='find . -type f -name "*.webm" -exec bash -c '"'"'FILE="$1"; ffmpeg -i "${FILE}" -vn -c:a libmp3lame -y "${FILE%.webm}.mp3";'"'"' _ '"'"'{}'"'"' \;'
alias mp42mp3='find . -type f -name "*.mp4" -exec bash -c '"'"'FILE="$1"; ffmpeg -i "${FILE}" -vn -c:a libmp3lame -y "${FILE%.mp4}.mp3";'"'"' _ '"'"'{}'"'"' \;'
alias wav2mp3='find . -type f -name "*.wav" -exec bash -c '"'"'FILE="$1"; ffmpeg -i "${FILE}" -vn -c:a libmp3lame -y "${FILE%.wav}.mp3";'"'"' _ '"'"'{}'"'"' \;'

# ls, grouping directories last
alias lsdl='ls -1 --group-directories-first | tac'

# ls, grouping directories first
alias lsdf='ls -1 --group-directories-first'

# ls, grouping by file extensions
alias lsfe='ls -X'

# Fix mispelling
alias sl=ls
alias cim=vim
alias vin=vim

# open bashrc
alias bashrc='vim ~/.bashrc'

# open vimrc 
alias vimrc='vim ~/.vimrc'

# Get the local weather
alias weather='curl wttr.in/cincinnati'

# fix common misspelling
alias histroy=history

# Note: qpdf is best for decrypting pdfs.

alias cdmusic='cd "/mnt/c/Users/e22-sargentzw/OneDrive - Elder High School/My Custom Apps/0 General Files/Music"'

alias countfiles='ls -1 | wc -l'

# Ls with size in megabytes
alias lswsize='ls -l --block-size=M'

# Upgrade and update with one command
alias upgrade='sudo apt-get update -y && sudo apt-get upgrade -y'

# Make ed easier to use:
ed() {
	command ed -p\* "$@" -v; 
}

# get the size of a file
size () {
	du -h "$1"
}

# fix keyboard
alias fixkeyboard='echo 2 | sudo tee /sys/module/hid_apple/parameters/fnmode'
# check keyboard
alias checkkeyboard='cat /sys/module/hid_apple/parameters/fnmode'

# probably a bad idea - run bash commands in terminal - alternative to watch
bash_watch () {
	while true; do
		"$@"
		printf "\033[A"
		sleep 3
	done
}

# 'ranger' is hard to type
alias r=ranger

# tree does not fit on one page
alias treel='tree | less'
alias treell='tree -L 2 | less'
alias treelll='tree -L 3 | less'

# new entry
alias neo='python3 /home/sarge/Documents/AnoraksAlmanac/Code/main.py'

# tmux is a long word
alias t=tmux

# I can't spell
alias gvv=gcc

# know where I am
# show files and directory statistics (how many files there are)
dirall () {
	echo "";
	ls -1a | tail -n +3;
	echo "";
	pwd;
	TREEPUT=$(tree -a);
	echo -e "Overall:\t" $(echo "${TREEPUT}" | tail -1);
	COUNT=`expr $(echo "${TREEPUT}" | wc -l) - 3`;
	echo -e "Total:\t\t" $COUNT "items";
	echo -e "This folder:\t" $(($(ls -1a | wc -l)-2)) "items"
}

# know where I am
# show files and directory statistics (how many files there are)
dir () {
	echo "";
	ls -1;
	echo "";
	pwd;
	TREEPUT=$(tree);
	echo -e "Overall:\t" $(echo "${TREEPUT}" | tail -1);
	COUNT=`expr $(echo "${TREEPUT}" | wc -l) - 3`;
	echo -e "Total:\t\t" $COUNT "items";
	echo -e "This folder:\t" $(ls -1 | wc -l) "items"
}

# common watch commands
## see number of files in system
alias watchdir='
	watch "
		TREEPUT=tree;
		COUNT=\`expr \$(\$TREEPUT | wc -l) - 3\`; 

		pwd;
		echo ""; 
		echo "Overall:" \$(\$TREEPUT | tail -1);
		echo "Total:" \$COUNT "items"; 
		echo ""; 
		echo "This folder:"; 
		tree -L 1;
	"
'

# stopwatch command
stopwatch () {
	date1=`date +%s`;
	while true; do 
		echo -ne "\t$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
	done
}

# copy working directory to clipboard
copypwd () {
	echo -n $(pwd) > ~/.pwd-buffer; # Write pwd with no newline
    xsel -i -b < ~/.pwd-buffer;
	rm ~/.pwd-buffer;
}

# copy file path to clipboard
copyrealpath () {
	echo -n $(realpath $@) > ~/.realpath-buffer; # Write pwd with no newline
    xsel -i -b < ~/.realpath-buffer;
	rm ~/.realpath-buffer;
}


## The following are based on file structure of my 2020 Linux Machine

# clean testing directory
alias cleanUpTestingDir='mv TestingThings/* TestingThings/.NotInUse/'

# update everything, and turn off the computer
# backup files
alias backup='time /usr/bin/python3 /home/sarge/Code/Python3/copyFiles.py'

goodnight () {
	clear;
	echo "Goodnight."; 
	sleep 1;
	echo "Updating software, backing up files, and then suspending.";
	echo " ";
	sleep 1;
	echo "Updating Software:";
	sudo apt-get update && sudo apt-get -y upgrade;
	echo -e "\n\nYou should be able to leave the computer during this time. \n\n";
	backup;
	echo "Suspending now.";
	sleep 3;
	sudo systemctl suspend;
}

# make autocomplete case insensitive
update_autocomplete () {
	# add option to /etc/inputrc to enable case-insensitive tab completion for all users
	echo 'set completion-ignore-case On' | sudo tee -a /etc/inputrc
}

# go to flashdrive
alias flashdrive='cd /media/sarge/Backup'

# Compile a project I'm working on.
b () {
	cd /home/sarge/Code/CPP/serpent-game/build;
	make;
	echo -e "Output:\n";
	./serpent.out;
	cd /home/sarge/Code/CPP/serpent-game/src;
}

# dictionary alias
alias define=sdcv

alias xopen=xdg-open

# trim wikit output
brief () {
	wikit $@ | fold -w 80 | head -3
}

