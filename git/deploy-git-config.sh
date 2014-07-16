#!bash

USER=${1-"eniotna.t@gmail.com"}

git config --global user.name "Antoine R. Dumont"
git config --global user.email $USER

# emacs
git config --global core.editor "emacsclient -nw"

# color everywhere (one flag)
git config --global color.ui true
# or in separate
#git config --global color.branch auto
#git config --global color.diff auto
#git config --global color.interactive auto
#git config --global color.status auto

# tool to help the merging
git config --global merge.tool meld

# aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

git config --global alias.r reset
git config --global alias.r1 "reset HEAD^"
git config --global alias.r2 "reset HEAD^^"
git config --global alias.rh "reset --hard"
git config --global alias.rh1 "reset HEAD^ --hard"
git config --global alias.rh2 "reset HEAD^^ --hard"

# unstage a file
git config --global alias.unstage 'reset HEAD~ --'

# see the last log
git config --global alias.last 'log -1 HEAD'

# global gitignore
git config --global core.excludesfile ~/.gitignore_global

# help when typo
git config --global help.autocorrect 1

# Adopt the new default git behavior where you need to explicitely define the branch you are working with
git config --global push.default.simple
