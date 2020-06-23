;;; bears-anzu.el --- bears configuration file for anzu

;;; Commentary:

; Counts and displays the number of all occurances of search.
; During replacing all occurances display new value at the screen.

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

;;; bears-anzu.el ends here
