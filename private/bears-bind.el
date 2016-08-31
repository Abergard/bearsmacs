;;; bears-bind.el --- local styles
;;; Commentary:

;;; Code:

(defun bears-prog-bind()
  "Base binds for all kinds of files."
  (local-set-key [C-tab] 'ff-get-other-file)
  (local-set-key (kbd "C-M-]") 'end-of-defun)
  (local-set-key (kbd "C-M-[") 'beginning-of-defun)
  (local-set-key (kbd "<C-M-return>") 'hs-toggle-hiding)
  )

(provide 'bears-bind)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-bind.el ends here
