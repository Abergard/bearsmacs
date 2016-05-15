;;; bears-solarized-dark.el --- local styles
;;; Commentary:

;;; Code:

(use-package color-theme
  :config
  (use-package color-theme-solarized
    :config
    (setq frame-background-mode 'dark)
    (load-theme 'solarized)
    (enable-theme 'solarized)
    )
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-solarized-dark.el ends here
