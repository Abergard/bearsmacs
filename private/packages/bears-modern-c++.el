;;; bears-modern-c++.el --- local styles
;;; Commentary:

;;; Code:

(use-package modern-cpp-font-lock
  :ensure t
  :config
  (add-to-list 'modern-c++-operators "=")
  (setq modern-c++-literal-integer t
        modern-c++-literal-boolean t
        modern-c++-literal-null-pointer t
        modern-c++-literal-string t)
  (modern-c++-font-lock-global-mode t)
  :diminish modern-c++-font-lock-mode
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-modern-c++.el ends here
