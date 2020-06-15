;;; bears-rust.el --- bears configuration file for Rust

;;; Commentary:

;;; Code:

(use-package rust-mode
  :ensure t
  :config
  )

(use-package cargo
  :after rust-mode
  :ensure t
  :hook (rust-mode . cargo-minor-mode)
  )

(use-package rustfmt
  :after rust-mode
  :ensure nil
  :bind (:map rust-mode-map
              ("<C-return>" . rust-format-buffer))
  )

(use-package flycheck-rust
  :after rust-mode flycheck-mode
  :ensure t
  :hook (flycheck-mode . flycheck-rust-setup)
  )

;;; bears-rust.el ends here
