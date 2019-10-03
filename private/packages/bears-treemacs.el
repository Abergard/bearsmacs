;;; bears-treemacs.el --- local styles
;;; Commentary:

;;; Code:

(use-package treemacs
  :ensure t
  :config
  (progn
    (setq treemacs-follow-after-init          t
          treemacs-width                      35
          treemacs-indentation                2
          treemacs-git-integration            t
          treemacs-collapse-dirs              3
          treemacs-silent-refresh             nil
          treemacs-change-root-without-asking nil
          treemacs-sorting                    'alphabetic-desc
          treemacs-show-hidden-files          t
          treemacs-never-persist              nil
          treemacs-is-never-other-window      nil
          treemacs-goto-tag-strategy          'refetch-index)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t))
  ;; :bind
  ;; (:map global-map
  ;;       ([f8]        . treemacs-toggle)
  ;;       ("M-0"       . treemacs-select-window)xc
  ;;       ("C-c 1"     . treemacs-delete-other-windows)
  ;;       ("C-c tt"    . treemacs-toggle)
  ;;       ("C-c tT"    . treemacs)
  ;;       ("C-c t C-t" . treemacs-find-file))
  )

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t
  :bind (:map global-map
              ("C-c tp" . treemacs-projectile)
              ("C-c tP" . treemacs-projectile-toggle)))

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-treemacs.el ends here
