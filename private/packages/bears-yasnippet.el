;;; bears-yasnippet.el --- local styles
;;; Commentary:

;;; Code:

(use-package yasnippet
  :config
  (defadvice bears-prog-style (after bears-yasnippet activate)
    (yas-global-mode 1)
    )
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  :diminish yas-minor-mode)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-yasnippet.el ends here
