;;; bears-company-rtags.el --- local styles
;;; Commentary:

;;; Code:

(when (require 'company nil 'noerror)
  (when (require 'rtags nil 'noerror)
    (add-to-list 'company-backends '(company-rtags))
    )
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-company-rtags.el ends here
