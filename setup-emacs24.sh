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

(global-set-key (kbd "C-c C-j") 'term-line-mode)

(setq-default fill-column 120)

;; ===================================================================
;; auto complete
;; ===================================================================

(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.4/dict")
(require 'auto-complete-config)
(ac-config-default)

;; ===================================================================
;; Some clojure/slime setup
;; ===================================================================

(require 'clojure-mode)
(add-to-list 'auto-mode-alist '("\.clj$" . clojure-mode))
(require 'midje-mode)
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

;; ===================================================================
;; Some org-mode setup
;; ===================================================================

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

;; ===================================================================
;; To show/hide block of code
;; ===================================================================

(require 'fold-dwim)
(global-set-key (kbd "C-c j") 'fold-dwim-toggle)
(global-set-key (kbd "C-c l") 'fold-dwim-hide-all)
(global-set-key (kbd "C-c ;") 'fold-dwim-show-all)

;; ===================================================================
;; C-x C-l to lower case ; C-x C-u to upper case
;; ===================================================================

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; ===================================================================
;; Find file in project
;; ===================================================================

(eval-after-load 'find-file-in-project
  '(progn
     ;; add 'entreprise' files patterns (cough!)
     (setq ffip-patterns
           (append ffip-patterns
                   '("*.css" "*.csv" "*.htm" "*.java" "*.js" "*.json"
                     "*.jsp" "*.php" "*.properties" "*.sql" "*.xml")))
     ;; increase the max number of files, otherwise some files will be
     ;; 'unfindable' on big projects
     (setq ffip-limit 4096)))

;; ===================================================================
;; To dynamically extend emacs via macros
;; ===================================================================

(defun save-macro (name)                  
  "save a macro. Take a name as argument and save the last
     defined macro under this name at the end of your .emacs"
     (interactive "SName of the macro :")  ; ask for the name of the macro    
     (kmacro-name-last-macro name)         ; use this name for the macro    
     (find-file user-init-file)          ; open ~/.emacs or other user init file 
     (goto-char (point-max))               ; go to the end of the .emacs
     (newline)                             ; insert a newline
     (insert-kbd-macro name)               ; copy the macro 
     (newline)                             ; insert a newline
     (switch-to-buffer nil))               ; return to the initial buffer

EOF

