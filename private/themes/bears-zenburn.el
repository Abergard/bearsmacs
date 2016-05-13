;;; bears-zenburn.el --- local styles
;;; Commentary:

;;; Code:

(use-package zenburn-theme
  :config
  (load-theme 'zenburn t)
  (defadvice bears-color-style (after bears-theme activate)
    )
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-zenburn.el ends here
