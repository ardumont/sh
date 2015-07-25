;;; emacs-clean.el

;;; Code:

(setq package-user-dir (concat default-directory "elpa"))
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)
(package-refresh-contents)
