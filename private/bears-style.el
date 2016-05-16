;;; bears-styles.el --- local styles
;;; Commentary:

;;; Code:

(require 'cc-mode)
(defun bears-color-style())
(defun bears-base-style()
  (setq tab-width 4
        indent-tabs-mode nil
        whitespace-style '(face tabs empty trailing lines-tail)
        whitespace-line-column 120)

  (whitespace-mode t)
  (show-paren-mode t)
  (volatile-highlights-mode t)
  (electric-pair-mode t)
  (column-number-mode t)
  (hl-line-mode t)
  (linum-mode t)
  (diminish 'hs-minor-mode)
  (diminish 'abbrev-mode)
  (abbrev-mode 1)

  (bears-color-style)
  )

(defun bears-prog-style()
  (bears-base-style)
  (hs-minor-mode t)
  )

(defun bears-c-style()
  (bears-prog-style)
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

(defun bears-text-style ()
  (bears-base-style))

(defun bears-lisp-style()
  (bears-prog-style))

(defun bears-ninja-style()
  (bears-prog-style))

(defun bears-ttcn3-style()
  (bears-c-style))

(defun bears-c++-style()
  (bears-c-style))

(defun bears-glsl-style()
  (bears-c-style))

(provide 'bears-style)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-style.el ends here
