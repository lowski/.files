#!/usr/bin/env zsh

# Load functions
fpath=($ZDOTDIR/functions $fpath)
autoload -Uz prompt && prompt

# History
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
setopt HIST_SAVE_NO_DUPS                # Do not write a duplicate event to the history file.
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

# Load files
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/completions.zsh
source $ZDOTDIR/plugins.zsh

# Bash like navigation
autoload -U select-word-style
select-word-style bash

# Enable default Emacs like keybindings (vi-mode is default if `$EDITOR` is set to vim)
bindkey -e
