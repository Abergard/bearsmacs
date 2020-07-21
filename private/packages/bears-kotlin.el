;;; bears-kotlin.el --- bears configuration file for Rust

;;; Commentary:

;;; Code:

(use-package kotlin-mode
  :ensure t
  :config
  )

(use-package flycheck-kotlin
  :after kotlin-mode flycheck-mode
  :ensure t
  :hook (flycheck-mode . flycheck-kotlin-setup)
  )

;;; bears-kotlin.el ends here
