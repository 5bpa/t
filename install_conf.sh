#!/bin/bash

sed '0,/^#EOF#$/d' "$0" > ~/.tmux.conf

exit

# DO NOT EDIT NEXT LINE
#EOF#
# Free the original Ctrl-b prefix keybinding
unbind C-b

# Setting the prefix from C-b to C-a
#set -g prefix C-a
#set -g prefix C-n
#set-option -g prefix C-j
#bind-key C-j send-prefix

# Reload the file with Prefix r
bind r source-file ~/.tmux.conf \; display "Reloaded!"

#### COLOUR (Solarized 256)
# default shell
#set-option -g default-shell /bin/bash

# default statusbar colors
#set-option -g status-bg colour235 #base02
#set-option -g status-fg colour136 #yellow
#set-option -g status-attr default

# message text
set-option -g message-bg colour235 #base02
set-option -g message-fg colour166 #orange

##### PANE
# pane border
#set-option -g pane-border-fg colour235 #base02
#set-option -g pane-active-border-fg colour240 #base01

# pane number display
set-option -g display-panes-active-colour colour33 #blue
set-option -g display-panes-colour colour166 #orange

# Moving between panes
bind-key -n C-H select-pane -L
bind-key -n C-J select-pane -D
bind-key -n C-K select-pane -U
bind-key -n C-L select-pane -R

bind -r h select-pane -L
bind -r j select-pane -D
bind -r k select-pane -U
bind -r l select-pane -R

# Set the base index for panes to 1 instead of 0
setw -g pane-base-index 1

# Splitting panes
bind | split-window -h
bind - split-window -v

# Synchronize pane
bind + setw synchronize-panes on
bind = setw synchronize-panes off

# clock
set-window-option -g clock-mode-colour colour64 #green

setw -g xterm-keys on

setw -g mode-keys vi
set -g status-keys vi
set -g history-limit 10000

set -g default-terminal "screen-256color"

#### WINDOW

bind | split-window -h
bind - split-window -v
bind-key -n C-t split-window -h

#bind-key -n F1 new-window
#bind-key -n F2 previous-window
#bind-key -n F3 next-window
#bind-key -n F4 copy-mode
#bind-key -n F5 set-window-option synchronize-panes
#bind-key -n F6 select-layout even-horizontal
#bind-key -n F7 select-layout tiled
bind -n F1 select-window -t 1
bind -n F2 select-window -t 2
bind -n F3 select-window -t 3
bind -n F4 select-window -t 4
bind -n F5 select-window -t 5
bind -n F6 select-window -t 6
bind -n F7 select-window -t 7
bind -n F8 select-window -t 8
bind -n F9 select-window -t 9
bind -n F10 select-window -t 10

# Set the base index for windows to 1 instead of 0
set -g base-index 1

set-window-option -g automatic-rename on
set-option -g set-titles on

# THEME
set -g status-bg black
set -g status-fg white
set -g window-status-current-bg white
set -g window-status-current-fg black
set -g window-status-current-attr bold
set -g status-interval 60
set -g status-left-length 30
set -g status-left '#[fg=green](#S) #(whoami)'
set -g status-right '#[fg=yellow]#(cut -d " " -f 1-3 /proc/loadavg)#[default] #[fg=white]%H:%M#[default]'
#set-window-option -g window-status-format '%I:#(whoami)@#(hostname)'
#set-window-option -g window-status-current-format '%I:#(whoami)@#(hostname)'

# Setting the delay between prefix and command
#set -s escape-time 0
set -sg escape-time 1

# Mouse supprt
#setw -g mode-mouse on
set -g mouse on

#run-shell /home1/jaeswith/.usr/tmux-logging/logging.tmux
