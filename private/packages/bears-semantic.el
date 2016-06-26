;;; bears-semantic.el --- local styles
;;; Commentary:

;;; Code:

(defadvice bears-prog-style (after bears-semantic activate)
  (ignore-errors
    (semantic-mode 1)
    (semantic-stickyfunc-mode 1)
    )
)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-semantic.el ends here
