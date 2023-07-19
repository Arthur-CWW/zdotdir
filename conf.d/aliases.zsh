#####
# My aliases
#
# References
# - https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789#.vh7hhm6th
# - https://github.com/webpro/dotfiles/blob/master/system/.alias
# - https://github.com/mathiasbynens/dotfiles/blob/master/.aliases
# - https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/common-aliases/common-aliases.plugin.zsh
#####

alias dev="pnpm dev"
alias -- -='cd -'
alias dirh='dirs -v'
dotdot=".."
for index ({1..9}); do
  alias "$index"="cd +${index}"
  alias -g "..$index"="$dotdot"
  dotdot+='/..'
done
unset index dotdot
alias l=exa
alias g=git
alias ping='ping -c 5'
alias vi=nvim
GREP_EXCL=(.bzr CVS .git .hg .svn .idea .tox)
alias grep="${aliases[grep]:-grep} --exclude-dir={\${(j.,.)GREP_EXCL}}"
alias ls='exa'
alias ll='ls -lh'
alias la='ls -lAh'
alias ldot='ls -ld .*'
alias cd..='cd ..'
alias zz='exit'
alias tarls="tar -tvf"
alias untar="tar -xf"
alias timestamp="date '+%Y-%m-%d %H:%M:%S'"
alias datestamp="date '+%Y-%m-%d'"
# alias fd='find . -type d -name'
# alias ff='find . -type f -name'
alias zshrc='${EDITOR:-vim} "${ZDOTDIR:-$HOME}"/.zshrc'
alias zshrc='${EDITOR:-vim} "${ZDOTDIR:-$HOME}"/.zshrc'
alias zbench='for i in {1..10}; do /usr/bin/time zsh -lic exit; done'
alias zdot='cd $ZDOTDIR'
IWD=${IWD:-$PWD}
alias iwd='cd $IWD'
alias py='python3'
alias pip3update="pip3 list --outdated | cut -d ' ' -f1 | xargs -n1 pip3 install -U"
alias pipup="pip3 list --outdated | cut -d ' ' -f1 | xargs -n1 pip3 install -U"
alias activate="source .venv/bin/activate"
alias -g '$'=''
alias -g pn=pnpm
alias -g npx=pnpx
alias -g 'cat'='batcat '
alias -g yarn=pnpm
alias clipboard='xclip -selection clipboard'
alias -g npm=pnpm
alias dev="pnpm dev"
alias nvm='fnm'
hash -d wezdir=$HOME/.config/wezterm
# hash -d vimdir=$HOME/.config/nvim
hash -d vimdir=$XDG_CONFIG_HOME/nvim
hash -d gitconf=$HOME/.config/git
hash -d compdir=$DOTFILES/zsh/completions
# hash -d vimdir=
# DEFAULT_DIR=/home/arthur/Documents
# declare -A directories=(
# 	[$DEFAULT_DIR/projects]=projects
# 	[$DEFAULT_DIR/practice]=practice
# 	[$DEFAULT_DIR/notes]=notes
# 	[$DEFAULT_DIR/github]=github
# 	[$DEFAULT_DIR]=home
# 	[$DEFAULT_DIR/books]=books
# 	[$DEFAULT_DIR/notebooks]=notebooks
# 	[$ZDOTDIR]=dotfiles
# 	[$HOME/.config]=config
# )

# for dir in "${(@k)directories}"; do
# 	if [ -d "$dir" ]; then
# 		alias "${directories[$dir]}"="cd $dir"
# 	else
# 		echo "$dir does not exist, please update your alias in $ZDOTDIR"
# 	fi
# done

zoxide_search_cd() {
    directory=$(zoxide query -i)
    if [[ -n $directory ]]; then
        zle push-input
        BUFFER="cd $directory"
        zle accept-line
    fi
}
strace() {
 	command strace "$@" 2>&1 | batcat --language=c
}
alias cheat='cht.sh'
alias bhelp='batcat --plain --language=help'
