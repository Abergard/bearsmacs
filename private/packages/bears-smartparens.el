;;; bears-smartparens.el --- local styles
;;; Commentary:

;;; Code:

(use-package smartparens
  :config
  (require 'smartparens-config)
  (smartparens-global-strict-mode 1)

  ;; (setq sp-base-key-bindings (quote sp))
  ;; :bind ("<C-DEL>" . sp-unwrap-sexp)
  )

;;; bears-smartparens.el ends here
