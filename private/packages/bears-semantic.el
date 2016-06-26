;;; bears-semantic.el --- local styles
;;; Commentary:

;;; Code:

(defadvice bears-prog-style (after bears-semantic activate)
    (semantic-mode 1)
    (semantic-idle-summary-mode 1)
    (semantic-stickyfunc-mode 1)
)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-semantic.el ends here
