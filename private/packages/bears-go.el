;;; bears-go.el --- bears configuration file for Go Lang

;;; Commentary:

;;; Code:

(use-package go
  :after go-mode
  :ensure nil
  :bind (:map go-mode-map
              ("<C-return>" . lsp-format-buffer))
  )

;;; bears-go.el ends here
