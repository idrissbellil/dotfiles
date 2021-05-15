source "$HOME/.antigen.zsh"

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle aws
antigen bundle docker
antigen bundle thefuck
antigen bundle ssh-agent
antigen bundle tmux

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions

antigen theme robbyrussell

antigen apply

#export SOCKS_SERVER="localhost:1080"
#export SOCKS_VERSION=5
#export no_proxy='192.168.1.*,localhost,www.buaa.edu.cn,www.zhaoping.com'

export PAGER="less"
export LESS="-R"
export EDITOR=vim
# nicer highlighting
if [ -f "/usr/share/source-highlight/src-hilite-lesspipe.sh" ]; then
    # ubuntu 12.10: sudo apt-get install source-highlight
    export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
elif [ -f "/usr/bin/src-hilite-lesspipe.sh" ]; then
    # fedora 18: sudo yum install source-highlight
    export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
fi
alias less='less -x4RFsX'


export PATH="/opt/sourcetrail/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export TASKDDATA=/var/lib/taskd

# Direnv Hook
eval "$(direnv hook zsh)"
eval $(keychain --eval --quiet id_rsa ~/.ssh/id_rsa  ~/.ssh/sshkey-starsearch.pem ~/.ssh/sshkey-lupin.pem ~/.ssh/sshkey-bastion.pem)

# Activate the virtualenv if there's a .venv path
function cd() {
  if [[ -d .venv ]] ; then
    deactivate
  fi

  builtin cd $1

  if [[ -d .venv ]] ; then
    source .venv/bin/activate
  fi
}

# kdesrc-build ##################################################

## Add kdesrc-build to PATH
export PATH="$HOME/kde/src/kdesrc-build:$PATH"

## Run projects built with kdesrc-build
function kdesrc-run
{
  source "$HOME/kde/build/$1/prefix.sh" && "$HOME/kde/usr/bin/$@"
}
#################################################################

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULES=ibus

# kdesrc-build #################################################################

## Add kdesrc-build to PATH
export PATH="$HOME/kde/src/kdesrc-build:$PATH"

## Autocomplete for kdesrc-run
function _comp-kdesrc-run
{
  local cur
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"

  # Complete only the first argument
  if [[ $COMP_CWORD != 1 ]]; then
    return 0
  fi

  # Retrieve build modules through kdesrc-run
  # If the exit status indicates failure, set the wordlist empty to avoid
  # unrelated messages.
  local modules
  if ! modules=$(kdesrc-run --list-installed);
  then
      modules=""
  fi

  # Return completions that match the current word
  COMPREPLY=( $(compgen -W "${modules}" -- "$cur") )

  return 0
}

## Register autocomplete function
complete -o nospace -F _comp-kdesrc-run kdesrc-run

################################################################################

