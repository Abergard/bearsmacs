;;; bears-irony.el --- local styles
;;; Commentary:

;;; Code:

(use-package irony
  :config
  (use-package irony-eldoc
    :diminish eldoc-mode
    )
  (defadvice bears-c++-style (after bears-irony activate)
    (irony-mode 1)
    )

  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async)
    (irony-eldoc 1))

  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

  (set-face-attribute 'eldoc-highlight-function-argument nil
                        :foreground "chartreuse4")

  :diminish irony-mode
  )

(when (require 'company nil 'noerror)
  (use-package company-irony)
  (use-package company-irony-c-headers)
  (add-to-list 'company-backends '(company-irony-c-headers company-irony))
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-irony.el ends here
