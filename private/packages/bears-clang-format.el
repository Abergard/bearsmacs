;;; bears-clang-format.el --- local styles
;;; Commentary:

;;; Code:


(use-package clang-format
  :bind (:map c++-mode-map
              ("<C-return>" . clang-format-buffer))
  )

;;; bears-clang-format.el ends here
