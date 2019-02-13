;;; bears-company-rtags.el --- local styles
;;; Commentary:

;;; Code:

(when (require 'company nil 'noerror)
  (add-to-list 'load-path "~/.emacs.d/elpa/company-rtags")
  (when (require 'company-rtags nil 'noerror)
    (setq rtags-autostart-diagnostics t
          rtags-completions-enabled t)
    (add-to-list 'company-backends '(company-rtags))
    )
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-company-rtags.el ends here
