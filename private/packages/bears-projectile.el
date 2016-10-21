;;; bears-projectile.el --- local styles
;;; Commentary:

;;; Code:

(use-package projectile
  :config
  (projectile-mode 1)
  :bind ("<C-tab>" . projectile-find-other-file)
  :diminish projectile-mode
  )

;; Local Variables:
;; End:

;;; bears-projectile.el ends here
