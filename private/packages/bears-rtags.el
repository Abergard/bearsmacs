;;; bears-rtags.el --- local styles
;;; Commentary:

;;; Code:

(use-package rtags
  :config
  (defadvice bears-c++-style (after bears-rtags activate)
    (rtags-enable-standard-keybindings)
    )
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-rtags.el ends here
