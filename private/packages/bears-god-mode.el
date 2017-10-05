;;; bears-god-mode.el --- local styles
;;; Commentary:

;;; Code:

(use-package god-mode
  :demand
  :bind (("M-i" . god-mode-all)
         ("<escape>" . god-mode-all)
         ("M-g M-g" . keyboard-quit)
         ("C-x C-1" . delete-other-windows)
         ("C-x C-2" . split-window-below)
         ("C-x C-3" . split-window-right)
         ("C-x C-0" . delete-window)
         :map isearch-mode-map
         ("M-i" . god-mode-isearch-activate)
         :map god-mode-isearch-map
         ("M-i" . god-mode-isearch-disable))
  :init
  (require 'god-mode-isearch)
  :config
  (setq god-exempt-major-modes nil
        god-exempt-predicates nil
        god-global-mode 1)

  (defun c/god-mode-update-cursor ()
    (cond (god-local-mode (progn (set-face-background 'cursor "#b680b1")))
          (t (progn (set-face-background 'cursor "#b680b1")))))

  (defun my-update-cursor ()
    (setq cursor-type (if (or god-local-mode buffer-read-only) 'box 'bar))
    (c/god-mode-update-cursor)
    )

  (add-hook 'god-mode-enabled-hook 'my-update-cursor)
  (add-hook 'god-mode-disabled-hook 'my-update-cursor)

  :diminish god-local-mode
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-god-mode.el ends here
