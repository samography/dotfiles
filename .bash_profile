# Defaults
export EDITOR=vi

# rbenv init
# $ rbenv versions
# $ rbenv global 1.9.3-p0
# $ ruby --version
eval "$(rbenv init -)"

# Get git branch for prompt
parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only HEAD) 2>/dev/null | sed -E 's:(refs/)?(heads|tags)/(.+): (\3):'
}

# Set Prompt
export PS1='\u@\h:\W$(parse_git_branch)$ '

# run `lws` at command line to open new local web server in current directory
function lws() { # via https://gist.github.com/1525217
    local host=`hostname`
    local port="${1:-8888}"
    (sleep 1 && open "http://${host}:${port}/")&
    python -m SimpleHTTPServer "$port"
}

# send any file to ~/sandbox on VPS.
# usage: $ stash index.html
function stash() {
    local filename="${1}"
    scp $filename (eval whoami)@my.server.name:~/inbox
}

