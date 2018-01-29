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

(global-set-key (kbd "<f12>") 'toggle-maximize-buffer)
(global-set-key "\M-n" "\C-u8\C-v")
(global-set-key "\M-p" "\C-u8\M-v")
(global-set-key (kbd "C-c SPC") 'rotate-windows)
(global-set-key (kbd "C-c C-SPC ") 'toggle-window-split)

(provide 'bears-bind)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-bind.el ends here
