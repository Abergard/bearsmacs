;;; bears-company.el --- local styles
;;; Commentary:

;;; Code:

(use-package company
  :init
  (defadvice bears-prog-style (after bears-company activate)
    (company-mode 1)
    )

  :config
  (setq
   company-idle-delay              0
   company-echo-delay              0
   company-minimum-prefix-length   1
   company-show-numbers            t
   company-tooltip-limit           20
   company-dabbrev-downcase        nil
   company-backends                '((company-elisp))
   company-begin-commands          '(self-insert-command)
   )
  :bind ("<M-return>" . company-complete-common)
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-company.el ends here
