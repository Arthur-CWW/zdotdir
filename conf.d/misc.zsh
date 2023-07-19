# misc - Set general Zsh config options here, or change plugin settings.
# Fix/reset bad plugin options.
setopt NO_BEEP
setopt NO_HIST_BEEP
# antidote
[[ -n "$ANTIDOTE_HOME" ]] || ANTIDOTE_HOME="$(antidote home)"
# autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

if [[ -n "$key_info" ]]; then
  # vi
  bindkey -M viins "$key_info[Control]F" vi-forward-word
  bindkey -M viins "$key_info[Control]E" vi-add-eol
fi
# history-substring-search
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=magenta,fg=white,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white,bold'

# keybinds
if [[ -n "$key_info" ]]; then
  # Emacs

  # Vi
  bindkey -M vicmd "k" history-substring-search-up
  bindkey -M vicmd "j" history-substring-search-down
  # ci"
  autoload -U select-quoted
  zle -N select-quoted
  for m in visual viopp; do
    for c in {a,i}{\',\",\`}; do
      bindkey -M $m $c select-quoted
    done
  done

  # ci{, ci(, di{ etc..
  autoload -U select-bracketed
  zle -N select-bracketed
  for m in visual viopp; do
    for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
      bindkey -M $m $c select-bracketed
    done
  done
  # ic camelCase motions
  # https://www.reddit.com/r/vim/comments/u0nihr/comment/i4alw49/?utm_source=share&utm_medium=web2x&context=3
  autoload -U select-word-match
  zle -N select-in-camel select-word-match
  zle -N select-a-camel select-word-match
  zstyle ':zle:*-camel' word-style normal-subword
  bindkey -M viopp ic select-in-camel


  zle -N zoxide_search_cd
  bindkey -M vicmd '^[s' zoxide_search_cd
  bindkey -M viins '^[s' zoxide_search_cd
  bindkey -M vicmd '^H' backward-kill-word
  bindkey -M viins '^H' backward-kill-word
  function _git-diff {
      zle push-input
      BUFFER="git diff"
      zle accept-line
  }
  zle -N _git-diff
  bindkey '^X' _git-diff



  # Emacs and Vi
  for keymap in 'emacs' 'viins'; do
    bindkey -M "$keymap" "$key_info[Up]" history-substring-search-up
    bindkey -M "$keymap" "$key_info[Down]" history-substring-search-down
  done

  unset keymap
fi
# ohmyzsh
ZSH=$ANTIDOTE_HOME/ohmyzsh/ohmyzsh
# magic-enter
# The belek/zsh-utils completion plugin also introduces compstyles. Let's use that!
(( ! $+functions[compstyle_zshzoo_setup] )) || compstyle_zshzoo_setup
ZSHZ_DATA=${XDG_DATA_HOME:=$HOME/.local/share}/z/data


