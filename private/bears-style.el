;;; bears-styles.el --- local styles
;;; Commentary:

;;; Code:

(require 'cc-mode)
(defun bears-color-style()
  "Use this function only in themes configuration by defadvice.")

(defun bears-base-style()
  "Base style for all kinds of files."
  (show-paren-mode t)
  (volatile-highlights-mode t)
  (electric-pair-mode t)
  (column-number-mode t)
  (hl-line-mode t)
  (linum-mode t)
  (diminish 'hs-minor-mode)
  (diminish 'abbrev-mode)
  (abbrev-mode 1)
  (window-numbering-mode 1)
  (semantic-mode)
  (semantic-stickyfunc-mode 1)
  (semantic-idle-summary-mode 1)
  (bears-color-style)
  )

(defun bears-prog-style()
  "Base style for all kinds of programming files."
  (bears-base-style)
  (hs-minor-mode t)
  (whitespace-mode t)
  )

(defun bears-c-style()
  "Base style for c-kind files."
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
  "Style for text files."
  (bears-base-style))

(defun bears-lisp-style()
  "Style for lisp files/"
  (bears-prog-style))

(defun bears-ninja-style()
  "Style for ninja files."
  (bears-prog-style))

(defun bears-python-style()
  "Style python files."
  (bears-prog-style))

(defun bears-ttcn3-style()
  "Style for ttcn3 files."
  (bears-c-style))

(defun bears-c++-style()
  "Style for c++ files."
  (bears-c-style))

(defun bears-glsl-style()
  "Style for glsl files."
  (bears-c-style))

(provide 'bears-style)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-style.el ends here
