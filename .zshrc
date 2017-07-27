# The following lines were added by compinstall
#export ZSH=$HOME/.oh-my-zsh
#export FBFONT=/usr/share/kbd/consolefonts/ter-216n.psf.gz
#ZSH_THEME="darkblood"
#SH_THEME="robbyrussell"
#source $ZSH/oh-my-zsh.sh
#plugins=(themes)

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list 'r:|[._-]=** r:|=**' 'l:|=* r:|=*' 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/home/bee/.zshrc'

#автокомплит
autoload -Uz compinit
compinit
#меню
zmodload zsh/complist
zstyle ':completion:*' menu yes select
export LS_COLORS='no=00;37:fi=00;37:di=01;34:ln=04;36:pi=33:so=01;35:do=01;35:bd=33;01:cd=33;01:or=31;01:su=37:sg=30:tw=30:ow=34:st=37:ex=01;31:*.jpg=36:*.jpeg=36:*.gif=36:*.bmp=36:*.pbm=36:*.pgm=36:*.ppm=36:*.tga=36:*.xbm=36:*.xpm=36:*.tif=36:*.tiff=36:*.png=36:*.mp3=01;35:*.ogg=01;35:*.flac=01;35:*.wav=01;35:*.mp4=01;32:*.mkv=01;32'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory beep extendedglob nomatch notify
unsetopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
autoload -U colors && colors
#PROMPT="[%n@%M %~]: "


# key bindings
#bindkey "e[1~" beginning-of-line
#bindkey "e[4~" end-of-line
#bindkey "e[5~" beginning-of-history
#bindkey "e[6~" end-of-history
#bindkey "e[3~" delete-char
#bindkey "e[2~" quoted-insert
#bindkey "e[5C" forward-word
#bindkey "eOc" emacs-forward-word
#bindkey "e[5D" backward-word
#bindkey "eOd" emacs-backward-word
#bindkey "ee[C" forward-word
#bindkey "ee[D" backward-word
#bindkey "^H" backward-delete-word
## for rxvt
#bindkey "e[8~" end-of-line
#bindkey "e[7~" beginning-of-line
## for non RH/Debian xterm, can't hurt for RH/DEbian xterm
#bindkey "eOH" beginning-of-line
#bindkey "eOF" end-of-line
## for freebsd console
#bindkey "e[H" beginning-of-line
#bindkey "e[F" end-of-line
## completion in the middle of a line
#bindkey '^i' expand-or-complete-prefix

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[2~" quoted-insert
bindkey "^[[5~" beginning-of-history
bindkey "^[[6~" end-of-history
bindkey "^[[3~" delete-char
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

#alias mocp="mocp -T trans"
alias -g pacman="sudo pacman"
alias -g vi="NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim"
#alias -g yaourt="sudo yaourt"
alias -g abs="sudo abs"
alias -g ls="ls --color=auto"
alias -g poweroff="sudo poweroff"
alias -g reboot="sudo reboot"
alias -g ncmpcpp="ncmpcpp -h bucCelLati@0.0.0.0"
#alias -g wicd="sudo wicd-curses"
alias sd='eval `slmenu < .list_for_slmenu`'

## Functions
#function ssh_state {
#    if [ -n "$SSh_CONNECTION" ]; then
#        echo "%{$fg[red]%}<%{$fg[white]%}SSH%{$fg[red]%}> "
#    fi
#}
#
#function collapse_pwd {
#    if [[ $(pwd) == $HOME ]]; then
#        echo $(pwd)
#    else    
#        echo $(pwd | sed -e "s,^$HOME,~,")
#    fi
#}
#
#function error_code {
#    if [[ $? == 0 ]]; then
#        echo ""
#    else
#        echo "%{$fg[white]%}<%{$fg[red]%}%?%{$fg[white]%}>%{$reset_color%}"
#fi
#}

#last_command='%(?.>>.<<)'
#alias grep="/usr/bin/grep $GREP_OPTIONS"
#unset GREP_OPTIONS

case $TERM in
    termite|*xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
		precmd () { print -Pn "\e]0;Termite\a" }
		preexec () { print -Pn "\e]0;$1\a" }
	;;
    screen|screen-256color)
    	precmd () {
			print -Pn "\e]83;title \"$1\"\a"
			print -Pn "\e]0;$TERM\a"
		}
		preexec () {
			print -Pn "\e]83;title \"$1\"\a"
			print -Pn "\e]0;$TERM - $1\a"
		}
	;;
esac

#function powerline_precmd() {
#    PS1="$(~/powerline-shell.py $? --shell zsh 2> /dev/null)"
#PS1="%{$fn[fixed]%}%{$fg[blue]%} »%{$reset_color%} "
PS1="%{$fn[fixed]%}%{$fg[blue]%} %~%{$reset_color%} "
#}

#function install_powerline_precmd() {
#	for s in "${precmd_functions[@]}"; do
#		if [ "$s" = "powerline_precmd" ]; then
#			return
#		fi
#	done
#	precmd_functions+=(powerline_precmd)
#}

#if [ "$TERM" != "linux" ]; then
#	install_powerline_precmd
#fi
