;;; bears-avy-flycheck.el --- local styles
;;; Commentary:

;;; Code:

(use-package avy

  :config
  (use-package avy-flycheck)
  (setq avy-timeout-seconds 0.3)
  :bind
  ("M-g M-l" . avy-goto-line)
  ("C-0" . avy-goto-word-1)
  ("M-g M-f" . avy-goto-char-timer)
  )

;;; bears-avy.el ends here
