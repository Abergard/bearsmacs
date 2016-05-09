;;; bears-styles.el --- local styles
;;; Commentary:

;;; Code:

(require 'cc-mode)
(defun bears-base-style()
  (setq tab-width 4
        indent-tabs-mode nil
        whitespace-style '(face tabs empty trailing lines-tail)
        whitespace-line-column 120)

  (whitespace-mode 1)
  (hs-minor-mode 1)
  (show-paren-mode 1)
  (diminish 'hs-minor-mode)
  (diminish 'abbrev-mode)
  )

(defun bears-c-style()
  (bears-base-style)

  (c-set-style "linux")
  (c-set-offset 'innamespace '0)
  (c-set-offset 'inextern-lang '0)
  (c-set-offset 'inline-open '0)
  (c-set-offset 'label '*)
  (c-set-offset 'case-label '*)

  (defvar c-hanging-braces-alist '((substatement-open)
                                   (block-close . c-snug-do-while)
                                   (extern-lang-open after)
                                   (inexpr-class-open after)
                                   (inexpr-class-close before)))
  (defvar c-offsets-alist '((substatement-open . 0)))

  (setq c-basic-offset 4)
  )

(defun bears-lisp-style()
  (message "bears-lisp-style")
  (bears-base-style))

(defun bears-ttcn3-style()
  (message "bears-ttcn3-style")
  (bears-c-style))

(defun bears-c++-style()
  (message "bears-c++-style")
  (bears-c-style))

(defun bears-ninja-style()
  (message "bears-ninja-style")
  (bears-base-style))

(defun bears-glsl-style()
  (message "bears-glsl-style")
  (bears-c-style))

(provide 'bears-style)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-style.el ends here
