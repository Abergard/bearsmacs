;;; bears-company.el --- local styles
;;; Commentary:

;;; Code:

(use-package company
  :config
  ;; (defadvice bears-prog-style (after bears-company activate)
  ;;   (company-mode 1)
  ;;   )
  (global-company-mode 1)

  (setq
   company-idle-delay              0
   company-echo-delay              0
   company-minimum-prefix-length   1
   company-show-numbers            t
   company-tooltip-limit           20
   company-dabbrev-downcase        nil
   company-begin-commands          '(self-insert-command)
   )

  (add-to-list 'company-backends '(company-elisp))

  :bind ("<M-return>" . company-complete-common)
  :diminish company-mode
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-company.el ends here
