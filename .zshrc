# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export FZF_DEFAULT_OPTS='--height 70% --layout=reverse --border top'
export EDITOR="nvim"
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
plugins=(git fzf-tab zsh-bat zsh-autosuggestions zsh-syntax-highlighting) 

source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:*' use-fzf-default-opts yes

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='helix'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias fzf="fzf --style full --preview 'fzf-preview.sh {}' --bind 'focus:transform-header:file --brief {}' --bind 'enter:execute(nvim {})+abort'"
alias ls='eza --all --long --git --group-directories-first --icons --header'
alias lst='eza --tree --icons -lbGF --git'
alias vi='nvim'
alias ll='eza -lbGF --git'
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
test -e /Users/rjok/.iterm2_shell_integration.zsh && source /Users/rjok/.iterm2_shell_integration.zsh || true
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH" 

set_gcc_13()
{
  export CC="$(brew --prefix gcc@13)/bin/gcc-13"
  export CXX="$(brew --prefix gcc@13)/bin/g++-13"
}
set_gcc()
{
  export CC="$(brew --prefix gcc)/bin/gcc"
  export CXX="$(brew --prefix gcc)/bin/g++"
}

set_clang_17()
{
  export CC="/opt/clang+llvm/clang+llvm-17.0.6/bin/clang"
  export CXX="/opt/clang+llvm/clang+llvm-17.0.6/bin/clang++"
}

# set_gcc_13

# export CFLAGS="-isysroot $(xcrun -show-sdk-path) ${CFLAGS}"
# export CXXFLAGS="-isysroot $(xcrun -show-sdk-path) ${CXXFLAGS}"
# export LDFLAGS="-L$(xcrun -show-sdk-path)/usr/lib ${LDFLAGS}"

export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"
export PATH=".local/bin:$PATH"
eval "$(oh-my-posh init zsh --config ~/.oh-my-zsh/themes/dracula.omp.json)"
echo "hot but 
hella cow!!" |cowsay -n

