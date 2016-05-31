;;; bears-diff-hl.el --- local styles
;;; Commentary:

;;; Code:

(use-package diff-hl
  :config
  (require 'diff-hl)
  (setq diff-hl-side 'right)
  (defadvice bears-prog-style (after bears-diff-hl activate)
    (diff-hl-mode 1)
    (diff-hl-flydiff-mode 1)
    )
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-diff-hl.el ends here
