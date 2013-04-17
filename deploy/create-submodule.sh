#!/bin/bash -x

HREPO=$HOME/repo/perso
REPO=$HREPO/emacs-live-packs
PACKS="install-packages-pack haskell-pack orgmode-pack lisp-pack git-pack mail-pack shell-pack browser-pack chat-pack clojure-pack nrepl-pack clojurescript-pack caml-pack"

for r in $PACKS ; do
    # $r in its own repository
    cp -r $REPO/$r $HREPO
    cd $HREPO/$r
    git init
    echo *.elc > .gitignore
    git add .
    git commit -am "Initial commit - $r in its own git repository."
    git remote add origin git@github.com:ardumont/$r.git
    git push -u origin master

    # emacs-live update
    cd $REPO
    git rm -r $r
    git submodule add git@github.com:ardumont/$r.git
    git commit -am "Add $r as a git submodule."
    git push origin master
done
