#!/bin/bash

##################### Setup emacs

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

;; starter-kit-eshell starter-kit-js starter-kit-ruby)
;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-bindings clojure-mode midje-mode multi-term switch-window slime ediff org flymake-shell graphviz-dot-mode)
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
(add-hook 'slime-repl-mode-hook
         (defun clojure-mode-slime-font-lock ()
           (let (font-lock-mode)
             (clojure-mode-font-lock-setup))))

;; paredit mode in the repl
(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))

;; =============================================================================
;; Clojurescript config
;; =============================================================================

(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Allow input to be sent to somewhere other than inferior-lisp
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This is a total hack: we're hardcoding the name of the shell buffer
(defun shell-send-input (input)
  "Send INPUT into the *shell* buffer and leave it visible."
  (save-selected-window
    (switch-to-buffer-other-window "*shell*")
    (goto-char (point-max))
    (insert input)
    (comint-send-input)))

(defun defun-at-point ()
  "Return the text of the defun at point."
  (apply #'buffer-substring-no-properties
         (region-for-defun-at-point)))

(defun region-for-defun-at-point ()
  "Return the start and end position of defun at point."
  (save-excursion
    (save-match-data
      (end-of-defun)
      (let ((end (point)))
        (beginning-of-defun)
        (list (point) end)))))

(defun expression-preceding-point ()
  "Return the expression preceding point as a string."
  (buffer-substring-no-properties
   (save-excursion (backward-sexp) (point))
   (point)))

(defun shell-eval-last-expression ()
  "Send the expression preceding point to the *shell* buffer."
  (interactive)
  (shell-send-input (expression-preceding-point)))

(defun shell-eval-defun ()
  "Send the current toplevel expression to the *shell* buffer."
  (interactive)
  (shell-send-input (defun-at-point)))

(add-hook 'clojure-mode-hook
          '(lambda ()
             (define-key clojure-mode-map (kbd "C-c e") 'shell-eval-last-expression)
             (define-key clojure-mode-map (kbd "C-c x") 'shell-eval-defun)))

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
