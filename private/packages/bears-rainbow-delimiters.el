;;; bears-clang-format.el --- local styles
;;; Commentary:

;;; Code:

(use-package rainbow-delimiters
  :config
  (defadvice bears-base-style (after bears-rainbow-delimiters activate)
    (rainbow-delimiters-mode t)))

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-clang-format.el ends here
