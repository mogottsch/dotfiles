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

plugins=(
    git 
    history-substring-search 
    zsh-autosuggestions 
    zsh-syntax-highlighting 
    zsh-vi-mode
)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

# conda/mamba autocompletion
fpath+=usr/share/zsh/site-functions/_conda

source $ZSH/oh-my-zsh.sh

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


alias config='/usr/bin/git --git-dir=/home/moritz/.cfg/ --work-tree=/home/moritz'
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
