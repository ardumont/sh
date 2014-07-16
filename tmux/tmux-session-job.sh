#!bash -x

# Goal: This script targets the templating creation of a tmux session to avoid repeatedly creating the same panes over
# and over again
# Use: $0 <name-of-the-session>

SESSION_NAME=$1
[ -z "$SESSION_NAME" ] && SESSION_NAME=job-session

# create a new session without attaching to it yet with the name $SESSION_NAME
tmux new-session -d -s $SESSION_NAME

# Then setup some window in it
tmux new-window -t $SESSION_NAME:1 -n 'Fitnesse'
tmux new-window -t $SESSION_NAME:2 -n 'Lily'
tmux new-window -t $SESSION_NAME:3 -n 'hdt'
tmux new-window -t $SESSION_NAME:4 -n 'wikeo'
tmux new-window -t $SESSION_NAME:5 -n 'git'

# Select the git window
tmux select-window -t $SESSION_NAME:0
# at last, attach to it
tmux -2 attach-session -t $SESSION_NAME
