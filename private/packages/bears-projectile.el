;;; bears-projectile.el --- local styles
;;; Commentary:
;;; WIP : better integration with *compilation* buffer
;;;       - show/hide *compilation* buffer to *auto* hide if not needed
;;; Code:

;; use ((nil . ((projectile-project-name . "unique project name"))))  -> .dir-locals.el
(use-package projectile
  :config
  (projectile-mode 1)
  ;; (defadvice projectile--run-project-cmd (before bears-projectile-compilation activate)
  ;;   (toggle-maximize-buffer))
  ;; (defadvice projectile--run-project-cmd (after bears-projectile-compilation-after activate)
  ;;   (toggle-maximize-buffer))
  :diminish projectile-mode
  :bind-keymap
  ("C-c C-p" .  projectile-command-map)
  :bind (:map projectile-command-map
              ("<f5>" . projectile-compile-project)
              ("<f7>" . projectile-run-project))
  )

;; Local Variables:
;; End:

;;; bears-projectile.el ends here
