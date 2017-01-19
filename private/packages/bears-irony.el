;;; bears-irony.el --- local styles
;;; Commentary:

;;; Code:

(use-package irony
  :config
  (defadvice bears-c++-style (after bears-irony activate)
    (irony-mode 1)
    )

  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async)
    )

  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

  :diminish irony-mode
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-irony.el ends here
