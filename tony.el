;; =============================================================================
;; General config
;; =============================================================================

(global-linum-mode 1); display line number in the left margin

;; =============================================================================
;; Clojure config
;; =============================================================================

(require 'clojure-mode)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
(require 'midje-mode)
(add-hook 'clojure-mode-hook 'midje-mode)

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
