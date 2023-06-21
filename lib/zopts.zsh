#
# zopts - set better zsh options
#
# https://zsh.sourceforge.io/Doc/Release/Options.html

#
# Options
#

# 16.2.1 Changing Directories
setopt auto_cd                 # If a command isn't valid, but is a directory, cd to that dir.
setopt auto_pushd              # Make cd push the old directory onto the dirstack.
setopt cdable_vars             # Change directory to a path stored in a variable.
setopt pushd_ignore_dups       # Don’t push multiple copies of the same directory onto the dirstack.
setopt pushd_minus             # Exchanges meanings of +/- when navigating the dirstack.
setopt pushd_silent            # Do not print the directory stack after pushd or popd.
setopt pushd_to_home           # Push to home directory when no argument is given.

# 16.2.2 Completion
setopt always_to_end           # Move cursor to the end of a completed word.
setopt auto_list               # Automatically list choices on ambiguous completion.
setopt auto_menu               # Show completion menu on a successive tab press.
setopt auto_param_slash        # If completed parameter is a directory, add a trailing slash.
setopt complete_in_word        # Complete from both ends of a word.
setopt path_dirs               # Perform path search even on command names with slashes.
setopt NO_flow_control         # Disable start/stop characters in shell editor.
setopt NO_menu_complete        # Do not autoselect the first completion entry.

# 16.2.3 Expansion and Globbing
setopt extended_glob           # Use extended globbing syntax.
setopt glob_dots               # Don't hide dotfiles from glob patterns.

# 16.2.4 History
# Use history.zsh

# 16.2.5 Initialization
# N/A

# 16.2.6 Input/Output
setopt interactive_comments    # Enable comments in interactive shell.
setopt rc_quotes               # Allow 'Hitchhiker''s Guide' instead of 'Hitchhiker'\''s Guide'.
setopt NO_clobber              # Don't overwrite files with >. Use >| to bypass.
setopt NO_mail_warning         # Don't print a warning if a mail file was accessed.
setopt NO_rm_star_silent       # Ask for confirmation for `rm *' or `rm path/*'

# 16.2.7 Job Control
setopt auto_resume             # Attempt to resume existing job before creating a new process.
setopt long_list_jobs          # List jobs in the long format by default.
setopt notify                  # Report status of background jobs immediately.
setopt NO_bg_nice              # Don't run all background jobs at a lower priority.
setopt NO_check_jobs           # Don't report on jobs when shell exit.
setopt NO_hup                  # Don't kill jobs on shell exit.

# 16.2.8 Prompting
setopt transient_rprompt       # Remove right prompt from prior commands
setopt prompt_subst            # Expand parameters in prompt variables

# 16.2.9 Scripts and Functions
setopt multios                 # Write to multiple descriptors.

# 16.2.10 Shell Emulation
# N/A

# 16.2.11 Shell State
# N/A

# 16.2.12 Zle
setopt combining_chars         # Combine 0-len chars with base chars (eg: accents).
setopt NO_beep                 # Be quiet
