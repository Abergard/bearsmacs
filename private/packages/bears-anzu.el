;;; bears-anzu.el --- local styles
;;; Commentary:

;;; Code:

(use-package anzu
  :config
  (global-anzu-mode +1)

  (setq
   anzu-mode-lighter ""
   anzu-deactivate-region t
   anzu-search-threshold 1000
   anzu-replace-threshold 50
   anzu-replace-to-string-separator " => ")

  (define-key isearch-mode-map [remap isearch-query-replace]  #'anzu-isearch-query-replace)
  (define-key isearch-mode-map [remap isearch-query-replace-regexp] #'anzu-isearch-query-replace-regexp)
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-anzu.el ends here
