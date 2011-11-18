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
(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings starter-kit-lisp slime slime-repl clojure-mode midje-mode org auto-complete flymake-shell)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; =============================================================================
;; Display line number in the left margin
;; =============================================================================

(global-linum-mode 1)

;; =============================================================================
;; Autocomplete setup
;; =============================================================================

;(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.4.20110207/dict")
(require 'auto-complete-config)
(ac-config-default)

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
