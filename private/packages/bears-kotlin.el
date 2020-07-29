;;; bears-kotlin.el --- bears configuration file for Rust

;;; Commentary:

;;; Code:

(use-package kotlin-mode
  :config
  )

(use-package flycheck-kotlin
  :after kotlin-mode flycheck-mode
  :hook (flycheck-mode . flycheck-kotlin-setup)
  )

;;; bears-kotlin.el ends here
