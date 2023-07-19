export DOTFILES=${DOTFILES:-$HOME/dotfiles}
export KEYTIMEOUT=1
export EDITOR=nvim
export VISUAL=code
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH=$PATH:$HOME/.pulumi/bin
export PATH="$PATH:$HOME/Documents/automation_scripts/launch"
# # go
# export GLOBALGOPATH=$HOME/Projects/golang
# export GOPATH=$GLOBALGOPATH
export FZF_DEFAULT_COMMAND='fd'
export PNPM_HOME="$HOME/.local/share/pnpm"
export WASMTIME_HOME="$HOME/.wasmtime"
export PATH="$HOME/.local/share/flatpak:$PATH"
export ISO_DIR="$HOME/Downloads/iso"
export COMP_DIR="$HOME/.config/zsh/completions"
# eval "$(fnm env --use-on-cd)"
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
export TEMP=$HOME/Downloads/tmp
# Set $PATH.
path=(
  $HOME/{,s}bin(N)
  # /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $HOME/.fnm
  $PNPM_HOME
  $HOME/.local/bin
  $HOME/.local/share/flatpak
  $path
)
