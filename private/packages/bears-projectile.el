;;; bears-projectile.el --- local styles
;;; Commentary:
;;; WIP : better integration with *compilation* buffer
;;;       - show/hide *compilation* buffer to *auto* hide if not needed
;;; Code:

;; use ((nil . ((projectile-project-name . "unique project name"))))  -> .dir-locals.el
(use-package projectile
  :after god-mode
  :demand
  :diminish projectile-mode
  :bind (:map projectile-command-map
              ("<f5>" . projectile-compile-project)
              ("<f7>" . projectile-run-project))
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode 1)
  ;; (defadvice projectile--run-project-cmd (before bears-projectile-compilation activate)
  ;;   (toggle-maximize-buffer))
  ;; (defadvice projectile--run-project-cmd (after bears-projectile-compilation-after activate)
  ;;   (toggle-maximize-buffer))
  )

;; Local Variables:
;; End:

;;; bears-projectile.el ends here
