;;; bears-company.el --- local styles
;;; Commentary:

;;; Code:

(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode)

  :config
  (require 'color)
  (let ((bg (face-attribute 'default :background)))
    (custom-set-faces
     `(company-tooltip
       ((t (:inherit default :background , (color-lighten-name bg 5)))))

     `(company-tooltip-search
       ((t (:background "steelblue" :foreground "white"))))

     `(company-tooltip-selection
       ((t (:background "steelblue" :foreground "white"))))

     `(company-tooltip-common
       ((t (:inherit font-lock-constant-face))))

     `(company-tooltip-annotation
       ((t (:inherit default :background ,
                     (color-lighten-name bg 5) :foreground "medium purple"))))))
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
