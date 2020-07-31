;;; bears-counsel.el --- local styles
;;; Commentary:

;;; Code:

(use-package counsel
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)))

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-counsel.el ends here
