

alias activate="source .venv/bin/activate"
alias julia="/Applications/Julia-1.11.app/Contents/Resources/julia/bin/julia"
#alias python="python3.13"

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
         elif [[ flag -eq "1" ]]; then
            deactivate
       fi
}

# Start IJulia notebook for cs515
# Less common alternative, relies on specific notebook() function behavior
# Start IJulia notebook for cs515
cs515() {
  julia -e 'using IJulia; notebook(dir=joinpath(homedir(), "Workspace", "cs515"))'
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


# Setting PATH for Python 3.13
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:${PATH}"
export PATH



# Setting PATH for Python 3.10
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
export PATH
. "$HOME/.cargo/env"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# >>> conda initialize (manual) >>>
conda_init() {
    __conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
            . "/opt/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="/opt/anaconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
}
# <<< conda initialize (manual) <<<

