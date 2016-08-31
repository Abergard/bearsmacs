;;; bears-configuration.el --- local styles
;;; Commentary:

;;; Code:

(defun bears-common-configuration()
  (bears-common-style)
  )

(defun bears-prog-configuration()
  (bears-prog-style)
  (bears-prog-bind)
  )

(defun bears-c-configuration()
  (bears-c-style)
  (bears-prog-bind)
  )

(defun bears-c++-configuration()
  (bears-c++-style)
  (bears-prog-bind)
  )

(defun bears-python-configuration()
  (bears-prog-configuration)
  )

(defun bears-ttcn3-configuration()
  (bears-c-configuration)
  )

(provide 'bears-configuration)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-configuration.el ends here
