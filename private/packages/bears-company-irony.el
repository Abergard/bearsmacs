;;; bears-company-irony.el --- local styles
;;; Commentary:

;;; Code:

(when (require 'company nil 'noerror)
  (when (require 'irony nil 'noerror)
    (use-package company-irony)
    (use-package company-irony-c-headers)
    (add-to-list 'company-backends '(company-irony-c-headers company-irony))
    )
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-company-irony.el ends here
