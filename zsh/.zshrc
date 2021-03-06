# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zhistory

ZSH_CUSTOM=/usr/share/zsh
ZSH=/usr/share/oh-my-zsh/
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"

# ctrl backspace delete word 
bindkey '^H' backward-kill-word

export TERMINFO_DIRS=/lib/terminfo

plugins=(
    git 
    history-substring-search 
    zsh-autosuggestions 
    zsh-syntax-highlighting 
    # zsh-vi-mode
)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

# conda/mamba autocompletion
fpath+=usr/share/zsh/site-functions/_conda

source $ZSH/oh-my-zsh.sh

# autocomplete hidden files
_comp_options+=(globdots)

function init_keybindings() {
    [ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
    [ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
    bindkey -s ^F "tmux-sessionizer\n"
}
init_keybindings

# init fzf after zsh-vi-mode to fix conflicting keybindings
# zvm_after_init_commands+=(init_keybindings)


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/moritz/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/moritz/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/moritz/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/moritz/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# source /usr/share/nvm/init-nvm.sh
if [ -s "$HOME/.nvm/nvm.sh" ]; then
  export NVM_DIR="$HOME/.nvm"
  nvm_cmds=(nvm node npm yarn)
  for cmd in $nvm_cmds ; do
    alias $cmd="unalias $nvm_cmds && unset nvm_cmds && . $NVM_DIR/nvm.sh && $cmd"
  done
fi
alias config='/usr/bin/git --git-dir=/home/moritz/.cfg/ --work-tree=/home/moritz'
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

precmd() {
    pwd > "/tmp/cwd"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

