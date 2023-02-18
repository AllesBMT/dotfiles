# Setting up keys for use later
typeset -g -A key
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

# Move entire words by using Ctrl+Left/Right
[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word
bindkey "^H" backward-kill-word

autoload -U colors && colors
export PATH="$HOME/.local/bin:$HOME/Scripts:$PATH"

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

PS1="%B%{$fg[red]%}[%{$fg[magenta]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

setopt autocd 
stty stop undef
setopt interactive_comments         

# Alias section
alias bye='shutdown -h now'
alias e='exit'
alias v='vim'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias la='ls -a'
alias htop='htop -t'
alias r="ranger"
#alias cat="kc"
alias degen="$HOME/Scripts/./degen.sh"
alias normal="$HOME/Scripts/./normal.sh"

# Autocomplete with interactive menu
autoload -U compinit promptinit
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' use-cache 1
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Loading colors from pywal
(cat /home/$USER/.cache/wal/sequences)

