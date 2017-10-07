;;; bears-yasnippet.el --- local styles
;;; Commentary:

;;; Code:

(use-package yasnippet
  :config
  (defadvice bears-prog-style (after bears-yasnippet activate)
    (yas-minor-mode 1))

  :diminish yas-minor-mode)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-yasnippet.el ends here
