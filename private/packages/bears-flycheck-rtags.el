;;; bears-flycheck-rtags.el --- local styles
;;; Commentary:

;;; Code:

(use-package flycheck-rtags
  :after flycheck rtags
  :config
  (require 'color)

  (defadvice bears-c++-style (after bears-flycheck-irony activate)
    (flycheck-select-checker 'rtags)

    ;; (setq flycheck-clang-language-standard "c++17")

    (setq-local flycheck-highlighting-mode nil)
    (setq-local flycheck-check-syntax-automatically nil)

    (set-face-attribute 'rtags-warnline nil
                        :background nil
                        :underline
                        '(:color "dark orange" :style wave))

    (set-face-attribute 'rtags-errline nil
                        :background nil
                        :underline
                        '(:color "red" :style wave) )
    )
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-flycheck-rtags.el ends here
