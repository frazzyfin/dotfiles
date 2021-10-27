
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"

# Default editor
export EDITOR="/usr/bin/vim"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# Dowload zsh-autosuggestions
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi    

# Download powerlevel10k
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

plugins=(git zsh-autosuggestions ripgrep z tmux)

# Env variables for oh-my-zsh plugins need to go here before they are sourced

source $ZSH/oh-my-zsh.sh

# User configuration

# Disable autocorrect
unsetopt correct_all

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias fd=fdfind
alias lzd=lazydocker
alias tmux='TERM=xterm-256color tmux'

source $HOME/.aliases

# load the fzf config
#export FZF_DEFAULT_COMMAND='fd --type f --hidden --no-ignore'
export FZF_DEFAULT_OPTS="--height 40% --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.config/broot/launcher/bash/br ] && source ~/.config/broot/launcher/bash/br

#add to path
typeset -U path # force unique values
# Append to path
# #path+=${HOME}/bin
# #path+=${HOME}/.cargo/bin
# # Prepend to path 
[ -e ${HOME}/bin ] && path[1,0]=${HOME}/bin
[ -e ${HOME}/.cargo/bin ] && path[1,0]=${HOME}/.cargo/bin
[ -e ${HOME}/.local/bin ] && path[1,0]=${HOME}/.local/bin

