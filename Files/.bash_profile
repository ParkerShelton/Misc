
#\d – Current date
#\t – Current time
#\h – Host name
#\# – Command number
#\u – User name
#\W – Current working directory
#\w – Current working directory with full path

alias gac='git add .; git commit -m'  # adds all files and commits it with a message
alias gp='git push origin'            # pushes branch to remote repository
alias gb='git branch'                 # returns the current branch
alias gbc='git checkout -b'           # changes to a new branch specified by you
alias gs='git status'                 # returns the status of the files
alias gc='git clone'                  # clones a remote repository with url pasted after

alias ls='ls -GFh'				            # allows colors
alias la='ls -a'				              # shows hidden files
alias .='cd ..'					              # goes back a directory
alias h='cd ~'					              # shortcut for home
alias c='clear'					              # clear the terminal
alias sqlcli='mysql -u root -p'			  # starts mysql client


function testport() { lsof -t -i :"$1"; }
function killport() { kill -kill "$(lsof -t -i :$1)"; }

# some colors
COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;93m"
COLOR_GREEN="\033[1;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_PURPLE="\033[0;35m"
COLOR_RESET="\033[0m"

COLOR_LIGHTBLUE="\033[0;94m"
COLOR_LIGHTGREEN="\033[1;4;92m"
COLOR_LIGHTMAGENTA="\033[0;95m"
COLOR_LIGHTCYAN="\033[0;96m"

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $COLOR_YELLOW		#COLOR_RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_YELLOW
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_GREEN
  else
    echo -e $COLOR_OCHRE
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch) "
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit)"
  fi
}

#	[$COLOR_WHITE\][\T \d]\e[0m\n 	This is for the date and time above commandline
# PS1="\[$COLOR_PURPLE\]\u\e[0m \[$COLOR_GREEN\]\w\e[0m:"
PS1="\[$COLOR_PURPLE\]\u \[$COLOR_GREEN\]\w: \[$COLOR_LIGHTBLUE\]"

PS1+="\[\$(git_color)\]"
PS1+="\[\$(git_branch)\e[0m\]"
# PS1+=""

# export PS1

# export CLICOLOR=1

#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
#export CLICOLOR=1
#export LSCOLORS=exfxbxdxcxegedabagacad

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH="$PATH:/usr/local/mongodb/bin"
export PATH="$PATH:~/Library/Python/3.7/bin"
export PATH="$PATH:/Library/Java/JavaVirtualMachines/jdk1.8.0_191.jdk/Contents/Home/bin"
export PATH="$PATH:/usr/local/share/dotnet/dotnet"

# For local server in browser
export LOCAL_IP=`ipconfig getifaddr en0`

alias serve="browser-sync start -s -f . --no-notify --host $LOCAL_IP --port 3030"
export JAVA_HOME=$(/usr/libexec/java_home)
