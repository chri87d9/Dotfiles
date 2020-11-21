#FUNCTIONS{{{
parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    }

#}}}

#ALIASES{{{
alias ls='ls --color=auto'
alias vim='nvim'
alias grep='grep --color=auto'
alias python='/usr/bin/python3'
alias sp='sudo pacman'
alias vpn='sudo openconnect https://remote.au.dk/AU-ACCESS -u au618187@uni.au.dk'
alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'
alias vpn='sudo openconnect https://remote.au.dk/AU-ACCESS -u au618187@uni.au.dk'
alias tle="curl -s http://celestrak.net/NORAD/elements/cubesat.txt | sed -ne '/DELPH/{p;n;p;n;p}'"
alias imgbk="rsync -Pz ms100@10.28.2.15:~/gomspace/mission/img0000\*.jpg ~/Dokumenter/imgs/new/"
alias imgbkf="scp ms100@10.28.2.15:~/gomspace/mission/\*[0-9].jpg /home/chris/full_imgs/"
alias sync="ssh ms100@10.28.2.15 ls gomspace/mission/ | grep img | sed -e 's/img//g' -e 's/\_thumb.jpg.map/,0/g' -e 's/\_thumb.jpg/,1/g' -e 's/.jpg.map/,2/g' -e 's/.jpg/,3/g' >> local.csv"
alias wget='wget --no-hsts'
alias bb='wget --no-hsts --user au618187 --ask-password'
alias yta='youtube-dl --add-metadata -i -x -f bestaudio/best'
#}}}

#Command completion
autoload -Uz compinit
zstyle ':completion:*' menu select
_comp_options+=(globdots)     # Include hidden files.
zmodload zsh/complist
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
compinit

# History in cache directory:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history



source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/lf/lfcd.sh
bindkey '^R' history-incremental-pattern-search-backward

#vi mode
bindkey -v
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

autoload -U colors && colors # Load colors

setopt PROMPT_SUBST
PROMPT='%B%{$fg[green]%}%1~ %{$fg[blue]%}@%{$fg[red]%}$(parse_git_branch)%{$reset_color%} >%b '

#For man colors
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

