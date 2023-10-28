eval "$(starship init zsh)"

export PATH=~/.cargo/bin:$PATH

test -z $VSCODE_INJECTION && \
    cat ~/.cache/wal/sequences

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt      incappendhistory    # Immediately append to the history file, not just when a term is killed

setopt      HIST_IGNORE_SPACE   # Removes commands from history when it's starting with a space


autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh




# ZSH Completion
autoload -Uz compinit; compinit
zstyle ':completion:*' menu select      # Tab completion menu highlighting
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'


# Change directory without `cd`
setopt autocd

# VIM style command editing
bindkey -v



# 10ms for key sequences (40ms default)
KEYTIMEOUT=1


# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
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
key[Control-R]="^R"

# setup key accordingly
[[ -n "${key[Home]}"          ]] && bindkey -- "${key[Home]}"          beginning-of-line
[[ -n "${key[End]}"           ]] && bindkey -- "${key[End]}"           end-of-line
[[ -n "${key[Insert]}"        ]] && bindkey -- "${key[Insert]}"        overwrite-mode
[[ -n "${key[Backspace]}"     ]] && bindkey -- "${key[Backspace]}"     backward-delete-char
[[ -n "${key[Delete]}"        ]] && bindkey -- "${key[Delete]}"        delete-char
[[ -n "${key[Up]}"            ]] && bindkey -- "${key[Up]}"            up-line-or-beginning-search
[[ -n "${key[Down]}"          ]] && bindkey -- "${key[Down]}"          down-line-or-beginning-search
[[ -n "${key[Left]}"          ]] && bindkey -- "${key[Left]}"          backward-char
[[ -n "${key[Right]}"         ]] && bindkey -- "${key[Right]}"         forward-char
[[ -n "${key[PageUp]}"        ]] && bindkey -- "${key[PageUp]}"        beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"      ]] && bindkey -- "${key[PageDown]}"      end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}"     ]] && bindkey -- "${key[Shift-Tab]}"     reverse-menu-complete
[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word
[[ -n "${key[Control-R]}"     ]] && bindkey -- "${key[Control-R]}"     history-incremental-search-backward


# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi


# Variables
export TERM=xterm

type vi>/dev/null && export EDITOR=vi
type vim>/dev/null && export EDITOR=vim
type nvim>/dev/null && export EDITOR=nvim
[[ -z $EDITOR ]] && echo "No EDITOR set!!!"


# Aliases
alias v=$EDITOR
alias vzh="v ~/.zshrc"

alias ls='ls --color=auto --group-directories-first'
alias ll="ls -l"
alias rm="trash"

# git
alias ga="git add"
alias gb="git branch"
alias gc!="git commit --amend"
alias gc="git commit"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gd="git diff"
alias gl="git pull"
alias glog="git log"
alias gm="git merge"
alias gp="git push"
alias grb="git rebase"
alias grbi="git rebase --interactive"
alias gs="git status"
alias gst="git stash"
alias gstp="git stash pop"
function gcmsg() { git commit -m "$*" }

# Sources
source /usr/share/nvm/init-nvm.sh
source /usr/share/fzf/key-bindings.zsh
