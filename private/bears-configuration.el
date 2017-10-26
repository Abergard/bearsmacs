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
  (bears-python-style)
  (bears-prog-configuration)
  )

(defun bears-ttcn3-configuration()
  (bears-ttcn3-style)
  (bears-prog-bind)
  )

(provide 'bears-configuration)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-configuration.el ends here
