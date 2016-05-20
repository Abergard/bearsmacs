;;; bears-elpy.el --- local styles
;;; Commentary:

;;; Code:

(use-package elpy
  :config
  (setq elpy-rpc-backend "jedi")
  (defadvice bears-python-style (after bears-elpy activate)
    (elpy-mode 1))
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-elpy.el ends here
