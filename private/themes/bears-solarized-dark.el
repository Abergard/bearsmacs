;;; bears-solarized-dark.el --- local styles
;;; Commentary:

;;; Code:

(use-package solarized-theme
  :config
  (load-theme 'solarized-dark)
  (set-face-attribute 'region nil
                      :foreground "#969696"
                      :background "#262626")
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-solarized-dark.el ends here
