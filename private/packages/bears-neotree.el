;;; bears-neotree.el --- local styles
;;; Commentary:

;;; Code:

(use-package neotree
  :config
  (setq neo-window-width 25
        neo-window-fixed-size nil
        neo-persist-show nil
        neo-smart-open t
        neo-theme 'classic)

  :bind ("<f8>" . neotree-toggle)
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-neotree.el ends here
