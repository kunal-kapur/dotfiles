
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

export AWS_KEY="~/aws-key.pem"
export OPENAI_API_KEY="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"
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[36m\]\$(parse_git_branch)\[\033[00m\] $ "


eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="/usr/local/mysql/bin:$PATH"



# Setting PATH for Python 3.10
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"
export PATH

export JAVA_HOME=$(brew --prefix openjdk@11)



# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/Users/kunalkapur/.opam/opam-init/init.sh' && . '/Users/kunalkapur/.opam/opam-init/init.sh' > /dev/null 2> /dev/null || true
# END opam configuration

export PATH="$PATH:/Users/kunalkapur/Downloads/z3-4.14.1-arm64-osx-13.7.4/bin/"
