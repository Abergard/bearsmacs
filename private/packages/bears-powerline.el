;;; bears-powerline.el --- local styles
;;; Commentary:

;;; Code:

(use-package powerline
  :config
  (powerline-default-theme)
  (defadvice bears-update (after bears-powerline activate)
    (powerline-reset)
    )
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-powerline.el ends here
