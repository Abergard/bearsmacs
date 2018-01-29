;;; bears-elpy.el --- local styles
;;; Commentary:

;;; Code:


(use-package elpy
  :config
  ;; (when (require 'company nil 'noerror)
  ;;   ;; (use-package jedi-core)
  ;;   ;; (use-package company-jedi)
  ;;   ;; (add-to-list 'company-backends '(company-jedi company-files))
  ;;   )

  ;; (setq elpy-rpc-backend "jedi")
  (defadvice bears-python-style (after bears-elpy activate)
    (elpy-mode 1)
    ;; (jedi:setup)
    )

  (use-package py-autopep8)
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-elpy.el ends here
