#!/bin/bash

##################### Setup emacs

EM_DIR=$HOME/.emacs.d

tee "$EM_DIR"/init.el <<EOF
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(starter-kit starter-kit-bindings starter-kit-lisp starter-kit-js starter-kit-ruby starter-kit-eshell clojure-mode midje-mode multi-term switch-window slime slime-repl ediff org flymake-shell graphviz-dot-mode auto-complete cljdoc fold-dwim)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; some multi term tweaks
(require 'multi-term)
(global-set-key (kbd "C-c C-j") 'term-line-mode)

;; some text tweaks

(setq-default fill-column 120)

;; auto complete

(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.4/dict")
(require 'auto-complete-config)
(ac-config-default)

;; Some clojure/slime setup

(require 'clojure-mode)
(require 'midje-mode)

(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))

(add-hook 'clojure-mode-hook 'midje-mode)
(add-hook 'clojure-mode-hook (lambda () (paredit-mode +1)))

; add color into the repl via clojure-jack-in
(add-hook 'slime-repl-mode-hook
         (defun clojure-mode-slime-font-lock ()
           (let (font-lock-mode)
             (clojure-mode-font-lock-setup))))

(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))

(set-language-environment "UTF-8") 
(setq slime-net-coding-system 'utf-8-unix)

;; Some org-mode setup

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

(setq org-todo-keywords
   '((sequence "TODO" "IN-PROGRESS" "PENDING" "|"  "DONE" "FAIL" "DELEGATED" "CANCELLED")))

;; To show/hide block of code

(require 'fold-dwim)
(global-set-key (kbd "C-c j") 'fold-dwim-toggle)
(global-set-key (kbd "C-c l") 'fold-dwim-hide-all)
(global-set-key (kbd "C-c ;") 'fold-dwim-show-all)

;; C-x C-l to lower case ; C-x C-u to upper case

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Find file in project

(eval-after-load 'find-file-in-project
  '(progn
     ;; add 'entreprise' files patterns (cough!)
     (setq ffip-patterns
           (append ffip-patterns
                   '("*.css" "*.csv" "*.htm" "*.java" "*.js" "*.json"
                     "*.jsp" "*.php" "*.properties" "*.sql" "*.xml"
                     "*.clj")))
     ;; increase the max number of files, otherwise some files will be
     ;; 'unfindable' on big projects
     (setq ffip-limit 8192)))

;; etags

(require 'etags)
EOF

# For some other stuff like macros, personal functions
tee $HOME/.emacs <<EOF
;; some personal functions that extends the one loaded from init.el

(defun exists-session-or-spawn-it (session-name session-command)
  "Given a session-name, check the existence of such a session. If it doesn't exist, spawn the session via the command session-command"
  (let ((proc (get-buffer-process session-name)))
    (unless (and proc (eq (process-status proc) 'run))
      (funcall session-command))))

(defun switch-to-buffer-or-nothing (process-name buffer-name)
  "Given a process name, switch to the corresponding buffer-name if the process is running or does nothing."
  (unless (string= (buffer-name) buffer-name)
    (let ((proc (get-buffer-process process-name)))
      (if (and proc (eq (process-status proc) 'run))       
          (switch-to-buffer-other-window buffer-name)))))

;; examples
;; (switch-to-buffer-or-nothing "*swank*" "*slime-repl nil*")    ;; clojure-jack-in
;; (switch-to-buffer-or-nothing "*terminal<1>*" "*terminal<1>*") ;; multi-term

(defun multi-term-once ()
  "Check the existence of a terminal with multi-term.
If it doesn't exist, launch it. Then go to this buffer in another buffer."
  (interactive)
  (unless (exists-session-or-spawn-it "*terminal<1>*" 'multi-term)
    (switch-to-buffer-or-nothing "*terminal<1>*" "*terminal<1>*")))

(defun clojure-jack-in-once ()
  "Check the existence of a swank session. If it doesn't exist, launch it."
  (interactive)
  (exists-session-or-spawn-it "*swank*" 'clojure-jack-in))

;; other bindings

(global-set-key (kbd "C-c C-z") 'multi-term-once)
(add-hook 'clojure-mode-hook 'clojure-jack-in-once)

;; To dynamically extend emacs via macros

(defun save-macro (name)                  
  "save a macro. Take a name as argument and save the last
     defined macro under this name at the end of your .emacs"
     (interactive "SName of the macro :")  ; ask for the name of the macro    
     (kmacro-name-last-macro name)         ; use this name for the macro    
     (find-file user-init-file)            ; open ~/.emacs or other user init file 
     (goto-char (point-max))               ; go to the end of the .emacs
     (newline)                             ; insert a newline
     (insert-kbd-macro name)               ; copy the macro 
     (newline)                             ; insert a newline
     (switch-to-buffer nil))               ; return to the initial buffer

;; Macro generated by emacs

(fset 'after-clj-jack-in
      (lambda (&optional arg)
        "A macro to dispose emacs buffer as i'm used to after the clojure-jack-in is started."
        (interactive "p")
        (kmacro-exec-ring-item (quote ([24 48 24 50 24 111 24 98 115 108 105 109 101 45 114 101 112 108 32 105 108 return 24 51 24 111 134217848 109 117 108 right return 108 101 110 32 backspace backspace 105 110 32 109 105 100 106 101 32 45 45 108 97 122 121 116 101 115 116 return 24 111] 0 "%d")) arg)))

(global-set-key (kbd "C-c C-j C-i") 'after-clj-jack-in)

EOF
