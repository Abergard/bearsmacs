;;; bears-configuration.el --- local styles
;;; Commentary:

;;; Code:

(defun bears-common-configuration()
  (bears-common-style)
  )

(defun bears-lisp-configuration()
  (bears-lisp-style)
  )

(defun bears-c-configuration()
  (bears-c-style)
  (bears-c-bind)
  )

(defun bears-c++-configuration()
  (bears-c++-style)
  (bears-c++-bind)
  )

(defun bears-python-configuration()
  (bears-python-style)
  (bears-python-bind)
  )

(provide 'bears-configuration)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-configuration.el ends here
