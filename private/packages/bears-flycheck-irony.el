;;; bears-flycheck-irony.el --- local styles
;;; Commentary:

;;; Code:

(when (require 'flycheck nil 'noerror)
  (use-package flycheck-irony
    :config
    (eval-after-load 'flycheck
      '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)
      )
    (defadvice bears-c++-style (after bears-flycheck-irony activate)
      (setq flycheck-clang-language-standard "c++14")
      )
    )
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-flycheck-irony.el ends here
