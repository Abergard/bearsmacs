;;; bears-whitespace.el --- local styles
;;; Commentary:

;;; Code:

(use-package whitespace
  :config
  (setq whitespace-style '(face tabs empty trailing lines-tail)
        whitespace-line-column 120)
  (defadvice bears-c-style (after bears-whitespace activate)
    (whitespace-mode t)
    )
  :diminish whitespace-mode
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-whitespace.el ends here
