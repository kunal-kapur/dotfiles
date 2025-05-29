
alias activate="source .venv/bin/activate"

function cd {
    flag=0
    if [ -e ".venv" ]; then
        flag=1
    fi
    builtin cd "$@"
    # Add your command here
    # For example:
        if [ -d ".venv" ]; then
            activate
         # HW Assingments are configured oddly so uncommenting this for now
         #elif [[ flag -eq "1" ]]; then
            #deactivate
       fi
}

function work() {
    loc="/Users/kunalkapur/Workspace/${1}"
    echo $loc
    cd $loc
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[36m\]\$(parse_git_branch)\[\033[00m\] $ "


eval "$(/opt/homebrew/bin/brew shellenv)"


# Setting PATH for Python 3.10
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"
export PATH

