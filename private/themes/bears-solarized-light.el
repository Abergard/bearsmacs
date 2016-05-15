;;; bears-solarized-light.el --- local styles
;;; Commentary:

;;; Code:

(use-package color-theme
  :config
  (use-package color-theme-solarized
    :config
    (setq frame-background-mode 'light)
    (load-theme 'solarized)
    )
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-solarized-light.el ends here
