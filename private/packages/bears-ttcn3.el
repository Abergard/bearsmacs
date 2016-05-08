;;; bears-ttcn3.el --- local styles
;;; Commentary:

;;; Code:

(add-to-list 'load-path "~/.emacs.d/elpa/ttcn3")
(when (require 'ttcn3 nil 'noerror)
  (add-to-list 'auto-mode-alist '("\\.ttcn3?" . ttcn-3-mode) 't)
  (add-hook 'ttcn-3-mode-hook 'bears-ttcn3-style)
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-ttcn3.el ends here
