;;; bears-flycheck-clang-tidy.el --- local styles
;;; Commentary:

;;; Code:

(use-package flycheck-clang-tidy
  :after flycheck
  :hook
  (flycheck-mode . flycheck-clang-tidy-setup)
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-flycheck-clang-tidy.el ends here
