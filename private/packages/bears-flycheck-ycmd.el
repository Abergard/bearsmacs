;;; bears-flycheck-ycmd.el --- local styles
;;; Commentary:

;;; Code:

(when (require 'flycheck nil 'noerror)
  (add-to-list 'load-path "~/.emacs.d/elpa/flycheck-rtags")
  (use-package flycheck-ycmd
    :config
      (defadvice bears-c++-style (after bears-flycheck-ycmd activate)
        (flycheck-ycmd-setup))
      )
  )

(use-package flycheck-clang-tidy
  :after flycheck
  :hook
  (flycheck-mode . flycheck-clang-tidy-setup)
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-flycheck-ycmd.el ends here
