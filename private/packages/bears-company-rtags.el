;;; bears-company-rtags.el --- local styles
;;; Commentary:

;;; Code:

(use-package company-rtags
  :after company rtags
  :config
  (setq rtags-autostart-diagnostics t
        rtags-completions-enabled t)
  (add-to-list 'company-backends '(company-rtags))
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-company-rtags.el ends here
