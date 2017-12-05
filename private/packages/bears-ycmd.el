;;; bears-ycmd.el --- local styles
;;; Commentary:

;;; Code:

(use-package ycmd
  :config
  (add-hook 'after-init-hook #'global-ycmd-mode)
  (set-variable 'ycmd-server-command `("python" ,(getenv "YCMD_HOME")))
  )
;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-ycmd.el ends here
