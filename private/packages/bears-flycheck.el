;;; bears-flycheck.el --- local styles
;;; Commentary:

;;; Code:

(use-package flycheck
  :init
  (defadvice bears-prog-style (after bears-flycheck activate)
    (flycheck-mode 1)
    )
  :diminish flycheck-mode
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-flycheck.el ends here
