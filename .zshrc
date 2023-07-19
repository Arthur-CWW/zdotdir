# setopt SOURCE_TRACE

[[ ${ZPROFRC:-0} -eq 0 ]] || zmodload zsh/zprof
# alias zprofrc="ZPROFRC=1 zsh"
[[ -f $ZDOTDIR/lib/zsh-essentials.zsh ]] && source $ZDOTDIR/lib/zsh-essentials.zsh

[[ -f $ZDOTDIR/.zstyles ]] && source $ZDOTDIR/.zstyles

ANTIDOTE_HOME=$ZDOTDIR/plugins/.external

# Clone antidote if necessary.
[[ -e $ZDOTDIR/.antidote ]] || git clone --depth=1 https://github.com/mattmc3/antidote.git $ZDOTDIR/.antidote

# Set the name of the static .zsh plugins file antidote will generate.
zsh_plugins=$ZDOTDIR/.zplugins.zsh

# Ensure you have a .zsh_plugins.txt file where you can add plugins.
[[ -f ${zsh_plugins:r}.txt ]] || touch ${zsh_plugins:r}.txt

# Lazy-load antidote.
fpath+=(${ZDOTDIR:-~}/.antidote)
autoload -Uz $fpath[-1]/antidote

# Generate static file in a subshell when .zsh_plugins.txt is updated.
if [[ ! $zsh_plugins -nt ${zsh_plugins:r}.txt ]] || [[ ! -s $zsh_plugins ]]; then
  #(antidote bundle <${zsh_plugins:r}.txt >|$zsh_plugins)
  (envsubst <${zsh_plugins:r}.txt | antidote bundle >|$zsh_plugins)
fi

# Source your static plugins file.
source $zsh_plugins

# Local settings/overrides
[[ -f $ZDOTDIR/.zshrc_local ]] && $ZDOTDIR/.zshrc_local


# Done profiling.
[[ ${ZPROFRC:-0} -eq 0 ]] || { unset ZPROFRC && zprof }
true

list_command_completions() {
  for command completion in ${(kv)_comps:#-*(-|-,*)}; do
    command_path=$(whence -p $command)
    printf "%-32s %s\n" $command_path $completion
  done | sort | tee /temp/zcommands
}



c() {
	if [[ $# -eq 0 ]]; then
		code .
	else
		code "$@"
	fi
}
set -o vi
bindkey -v

eval "$(zoxide init zsh)"

if [[ $TERM_PROGRAM != "vscode" ]]; then
	launch_detached() {
		nohup "$@" >/dev/null 2>&1 &
		disown
		zle reset-prompt
	}

	launch_nautilus() {
		launch_detached nautilus .
	}

	zle -N launch_nautilus
	bindkey "^[n" launch_nautilus
	open_settings() {
		echo "Opening settings"
		launch_detached code $ZDOTDIR
	}

	zle -N open_settings
	bindkey "^[," open_settings

	open_code() {
		launch_detached code .
	}

	zle -N open_code
	bindkey "^[." open_code

fi
alias google-chrome="flatpak run com.google.ChromeDev"

# fnm
# export PATH="/home/arthur/.fnm:$PATH"
# eval "`fnm env`"
export PATH="/home/arthur/.fnm:$PATH"
eval "`fnm env`"

# pnpm
export PNPM_HOME="/home/arthur/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
