#!/bin/bash

##################### Setup emacs

EM_DIR=$HOME/.emacs.d

# Delete the old directory
[ -d $EM_DIR ] && rm -rf $EM_DIR/*
mkdir -p $EM_DIR

tee "$EM_DIR"/init.el <<EOF
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(starter-kit starter-kit-bindings clojure-mode midje-mode multi-term switch-window slime slime-repl ediff org flymake-shell graphviz-dot-mode auto-complete cljdoc)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(global-set-key (kbd "C-c C-j") 'term-line-mode)

(global-linum-mode 1)

(setq-default fill-column 120)

'(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.4.20110207/dict")
'(require 'auto-complete-config)
'(ac-config-default)

(require 'clojure-mode)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
(require 'midje-mode)
(add-hook 'clojure-mode-hook 'midje-mode)
(add-hook 'clojure-mode-hook (lambda () (paredit-mode +1)))

; add color into the repl via clojure-jack-in
(add-hook 'slime-repl-mode-hook
         (defun clojure-mode-slime-font-lock ()
           (let (font-lock-mode)
             (clojure-mode-font-lock-setup))))

(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))

(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))

(column-number-mode)

(setq org-directory "~/org")

(setq org-startup-indented t)

(setq org-log-done 'time)

(setq org-default-notes-file (concat org-directory "/notes.org"))

(define-key global-map "\C-cc" 'org-capture)

(setq org-tag-alist '(("howTo" . ?h)
                      ("tech" . ?t)
                      ("emacs" . ?e)
                      ("orgMode" . ?o)
                      ("faq" . ?f)
                      ("firefox")
                      ("conkeror")
                      ("linux")))

EOF

# Install linum.el file (have the lines numbered on the side)
wget http://web.student.tuwien.ac.at/~e0225855/linum/linum.el --output-document $EM_DIR/linum.el
