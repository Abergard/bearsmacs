;;; bears-nxml.el --- bears configuration file for nxml

;;; Commentary:

;;; Code:

(require 'nxml-mode)

(defun format-xml ()
  "Format one line xml buffer to readable form."
  (interactive)
  (execute-kbd-macro (kbd "M-% > < RET > C-q C-j < RET ! C-M-\\"))
  )

(setq nxml-child-indent 4
      nxml-attribute-indent 4)

;;; bears-nxml.el ends here
