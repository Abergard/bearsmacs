;;; bears-stickyfunc.el --- local styles
;;; Commentary:

;;; Code:

(use-package stickyfunc-enhance
  :config
  (defadvice bears-prog-style (after bears-semantic activate)
    (ignore-errors
      (semantic-mode 1)
      (semantic-stickyfunc-mode 1)
      (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
      )
    )
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-stickyfunc.el ends here
