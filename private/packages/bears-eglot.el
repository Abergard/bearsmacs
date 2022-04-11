;;; bears-eglot.el --- local styles
;;; Commentary:

;;; Code:

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs '(c++-mode . ("clangd"
                                                    "--background-index"
                                                    "-j=8"
                                                    "--header-insertion=iwyu"
                                                    "--pch-storage=memory"
                                                    "--clang-tidy")))

  (when (require 'flycheck nil 'noerror)
    (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-gcc))
    )

  :hook ((c++-mode . eglot-ensure))
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-eglot.el ends here
