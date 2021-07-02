;;; bears-eglot.el --- local styles
;;; Commentary:

;;; Code:

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs '(c++-mode . ("clangd"
                                                    "--clang-tidy"
                                                    "--clang-tidy-checks=*,-fuchsia-*,-modernize-use-trailing-return-type,-llvm-*,-llvmlibc-*"
                                                    "--background-index"
                                                    "-j=8")))

  (when (require 'flycheck nil 'noerror)
    (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-gcc))
    )

  :hook ((c++-mode . eglot-ensure))
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-eglot.el ends here
