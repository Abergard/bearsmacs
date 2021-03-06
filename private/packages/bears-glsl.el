;;; bears-glsl.el --- local styles
;;; Commentary:

;;; Code:

(use-package glsl-mode)
(when (require 'flycheck nil 'noerror)
  (add-to-list 'load-path "~/.emacs.d/elpa/flycheck-glsl")
  (require 'flycheck-glsl)
  )

(when (require 'company nil 'noerror)
  (add-to-list 'load-path "~/.emacs.d/elpa/company-glsl")
  (require 'company-glsl)
  (add-to-list 'company-backends '(company-glsl))
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-glsl.el ends here
