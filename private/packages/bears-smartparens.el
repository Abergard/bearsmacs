;;; bears-smartparens.el --- local styles
;;; Commentary:

;;; Code:

(use-package smartparens
  :config
  (require 'smartparens-config)
  (smartparens-global-strict-mode 1)

  :bind ("<M-DEL>" . sp-unwrap-sexp)
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-smartparens.el ends here
