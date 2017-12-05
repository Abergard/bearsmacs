;;; bears-company-ycmd.el --- local styles
;;; Commentary:

;;; Code:


(when (require 'company nil 'noerror)
  (when (require 'ycmd nil 'noerror)
    (use-package company-ycmd
      :config
      (company-ycmd-setup)
      )
    )
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-company-ycmd.el ends here
