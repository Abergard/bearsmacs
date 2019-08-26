;;; bears-centaur-tabs.el --- local styles
;;; Commentary:

;;; Code:

(use-package centaur-tabs
  :demand
  :config
  (setq centaur-tabs-set-modified-marker t
        centaur-tabs-modified-marker "*"
        centaur-tabs-style "slant"
        centaur-tabs-set-icons t
        centaur-tabs-cycle-scope 'tabs
        centaur-tabs-adjust-buffer-order t)

  (centaur-tabs-mode t)
  (centaur-tabs-group-by-projectile-project)
  (centaur-tabs-enable-buffer-reordering)

  :bind
  ("M-[" . centaur-tabs-backward)
  ("M-]" . centaur-tabs-forward))

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-centaur-tabs.el ends here
