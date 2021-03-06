:;exec emacs -nw -Q -l "$0" -f main "$@"

(require 'cl)
(toggle-debug-on-error)

(defun main ()
  (interactive)
  (destructuring-bind (package &optional elpa-parent) command-line-args-left
    ;; Make the elpa dir for this if we need to.
    (when (and elpa-parent (not (file-exists-p elpa-parent)))
      (make-directory elpa-parent t))
    ;; Package stuff
    (setq package-user-dir (concat (or (concat elpa-parent "/") user-emacs-directory) ".elpa"))
    (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                             ("melpa" . "http://melpa.milkbox.net/packages/")))
    (package-initialize)
    (package-refresh-contents)

    ;; install package
    (if (and (file-exists-p (expand-file-name package))
             (not (file-directory-p (expand-file-name package))))
        (package-install-file (expand-file-name package))
      ;; Else must just be a package
      (package-install (intern package)))))

;; End
