;;; bears-srefactor.el --- local styles
;;; Commentary:

;;; Code:

(use-package srefactor
  :config
  (defadvice bears-c++-style (after bears-semantic activate)
    (semantic-mode 1)
    )
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-srefactor.el ends here
