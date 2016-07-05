;;; bears-avy-flycheck.el --- local styles
;;; Commentary:

;;; Code:

(use-package avy
  :config
  (use-package avy-flycheck)
  :bind
  ("M-g M-l" . avy-goto-line)
  ("M-g M-f" . avy-goto-char-timer)
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-avy-flycheck.el ends here
