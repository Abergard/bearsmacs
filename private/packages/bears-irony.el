;;; bears-irony.el --- local styles
;;; Commentary:

;;; Code:

(use-package irony
  :init
  (add-hook 'c++-mode-hook 'irony-mode)
  :config
  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  :diminish irony-mode
  )

(when (require 'flycheck nil 'noerror)
  (use-package flycheck-irony
    :init
    (add-hook 'c++-mode-hook (lambda ()
                               (setq flycheck-clang-language-standard "c++14")))
    (add-hook 'after-init-hook #'global-flycheck-mode)

    (eval-after-load 'flycheck
      '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
    )
  )

(when (require 'company nil 'noerror)
  (use-package company-irony)
  (use-package company-irony-c-headers)
  (add-to-list 'company-backends 'company-irony-c-headers)
  (add-to-list 'company-backends 'company-irony)
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-irony.el ends here
