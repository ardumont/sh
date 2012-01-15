#!/bin/bash -xe

WDIR=$(dirname $(readlink -f $0))
source $WDIR/check-ubuntu-version.sh

yes | sudo aptitude install python-software-properties
sudo add-apt-repository ppa:cassou/emacs
sudo tee -a /etc/apt/sources.list <<EOF

# For Emacs 24
deb http://ppa.launchpad.net/cassou/emacs/ubuntu $UBUNTU_VERSION main
deb-src http://ppa.launchpad.net/cassou/emacs/ubuntu $UBUNTU_VERSION main
EOF

# Update since the sources have been modified
sudo aptitude update

##################### Install emacs

# Install git and emacs
yes | sudo aptitude install emacs-snapshot

emacs --version

##################### Specific setup

EM_DIR=$HOME/.emacs.d

# Delete the old link
[ -d $EM_DIR ] && rm -rf $EM_DIR/*
mkdir -p $EM_DIR

tee "$EM_DIR"/init.el <<EOF
;; =============================================================================
;; Install needed packages if not present
;; =============================================================================

; some tricks from the emacs-starter-kit v2
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(ediff multi-term starter-kit starter-kit-lisp starter-kit-bindings slime slime-repl clojure-mode midje-mode org flymake-shell graphviz-dot-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; =============================================================================
;; Display line number in the left margin
;; =============================================================================

;; put binding for line-mode in t
(global-set-key (kbd "C-c C-j") 'term-line-mode)

;; linum mode activated by default
(global-linum-mode 1)

;; justification
(setq-default fill-column 120)

;; =============================================================================
;; Autocomplete setup
;; =============================================================================

'(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.4.20110207/dict")
'(require 'auto-complete-config)
'(ac-config-default)

;; =============================================================================
;; Clojure config
;; =============================================================================

(require 'clojure-mode)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
(require 'midje-mode)
(add-hook 'clojure-mode-hook 'midje-mode)

; add color into the repl via clojure-jack-in
(add-hook 'slime-repl-mode-hook 'clojure-mode-font-lock-setup)

;; =============================================================================
;; Org config
;; =============================================================================

;; display column number

(column-number-mode)

;; org dir

(setq org-directory "~/org")

;; indentation

(setq org-startup-indented t)

;; log work done

(setq org-log-done 'time)

;; notes directory

(setq org-default-notes-file (concat org-directory "/notes.org"))

;; notes binding

(define-key global-map "\C-cc" 'org-capture)

;; tags

(setq org-tag-alist '(("howTo" . ?h)
                      ("tech" . ?t)
                      ("emacs" . ?e)
                      ("orgMode" . ?o)
                      ("faq" . ?f)
                      ("firefox")
                      ("conkeror")
                      ("linux")))

EOF

#Install linum.el file
wget http://web.student.tuwien.ac.at/~e0225855/linum/linum.el --output-document $EM_DIR/linum.el
