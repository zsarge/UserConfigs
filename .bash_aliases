
alias poweroff="echo dont do it"

alias ls='ls --color'
alias py=python3
alias python=python3
alias apt='sudo apt-get'
alias win='cd "/mnt/c/Users/e22-sargentzw/OneDrive - Elder High School"'
alias su=sudo
alias lsn'=ls --color=no'

# Curl Commands
alias colortest='curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/ | bash'
alias networktest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'

alias aliases='vim ~/.bash_aliases && . ~/.bash_aliases'

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

# convert mkv to mp3
alias mkv2mp3='find . -type f -name "*.mkv" -exec bash -c '"'"'FILE="$1"; ffmpeg -i "${FILE}" -vn -c:a libmp3lame -y "${FILE%.mkv}.mp3";'"'"' _ '"'"'{}'"'"' \;'
alias webm2mp3='find . -type f -name "*.webm" -exec bash -c '"'"'FILE="$1"; ffmpeg -i "${FILE}" -vn -c:a libmp3lame -y "${FILE%.webm}.mp3";'"'"' _ '"'"'{}'"'"' \;'
alias mp42mp3='find . -type f -name "*.mp4" -exec bash -c '"'"'FILE="$1"; ffmpeg -i "${FILE}" -vn -c:a libmp3lame -y "${FILE%.mp4}.mp3";'"'"' _ '"'"'{}'"'"' \;'
alias wav2mp3='find . -type f -name "*.wav" -exec bash -c '"'"'FILE="$1"; ffmpeg -i "${FILE}" -vn -c:a libmp3lame -y "${FILE%.wav}.mp3";'"'"' _ '"'"'{}'"'"' \;'

# ls, grouping directories last
alias lsdl='ls -1 --group-directories-first | tac'

# ls, grouping directories first
alias lsdf='ls -1 --group-directories-first'

alias sl=ls

# open bashrc
alias bashrc='vim ~/.bashrc'

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
alias upgrade='sudo apt-get update && sudo apt-get upgrade'
