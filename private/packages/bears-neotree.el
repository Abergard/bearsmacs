;;; bears-neotree.el --- local styles
;;; Commentary:

;;; Code:

(use-package neotree
  :config
  (setq neo-window-width 50)
  (setq neo-persist-show nil)
  :bind ("<f8>" . neotree-toggle)
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-neotree.el ends here
