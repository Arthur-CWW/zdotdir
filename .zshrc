# load zprof first if we need to profile
[[ ${ZPROFRC:-0} -eq 0 ]] || zmodload zsh/zprof
alias zprofrc="ZPROFRC=1 zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zsh options
setopt extended_glob

() {
  # Use a zsh home other than $HOME.
  local zhome=${ZDOTDIR:-${XDG_CONFIG_HOME:-~/.config}/zsh}

  # Autoload functions dir.
  export ZFUNCDIR=$zhome/functions
  [[ -d $ZFUNCDIR ]] || mkdir -p $ZFUNCDIR
  fpath=($ZFUNCDIR $fpath)
  autoload -Uz autoload-dir
  autoload-dir $ZFUNCDIR

  # Allow user completions.
  fpath=($zhome/completions(-/FN) $fpath)

  # Set aliases.
  source $ZDOTDIR/lib/alias.zsh

  # conf.d
  local rcfile
  for rcfile in $zhome/conf.d/*.zsh(.N); do
    [[ ${rcfile:t} != '~'* ]] || continue
    source "$rcfile"
  done
}

# done profiling
[[ ${ZPROFRC:-0} -eq 0 ]] || { unset ZPROFRC && zprof }
