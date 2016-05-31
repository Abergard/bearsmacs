;;; bears-rtags.el --- local styles
;;; Commentary:

;;; Code:

(use-package rtags)

(when (require 'company nil 'noerror)
  (setq rtags-autostart-diagnostics t)
  (rtags-diagnostics)
  (setq rtags-completions-enabled t)
  (push 'company-rtags company-backends)
  (global-company-mode)
  (define-key c-mode-base-map (kbd "<C-tab>") (function company-complete))
  )

(when (require 'flycheck nil 'noerror)
  (require 'flycheck-rtags)
  (defadvice bears-c++-style (after bears-flycheck-irony activate)
    (flycheck-select-checker 'rtags)
    (setq-local flycheck-highlighting-mode nil)
    (setq-local flycheck-check-syntax-automatically nil)
    )
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-rtags.el ends here
