;;; bears-irony-eldoc.el --- local styles
;;; Commentary:

;;; Code:

(when (require 'irony nil 'noerror)
  (use-package irony-eldoc
    :config
    (defun my-irony-eldoc-mode-hook ()
      (irony-eldoc 1)
      )
    (add-hook 'irony-mode-hook 'my-irony-eldoc-mode-hook)
    ;; (set-face-attribute 'eldoc-highlight-function-argument nil
    ;;                     :foreground "chartreuse4")
    (setq irony-eldoc-use-unicode t)
    :diminish eldoc-mode
    )
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-irony-eldoc.el ends here
