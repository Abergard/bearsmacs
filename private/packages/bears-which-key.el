;;; bears-which-key.el --- local styles
;;; Commentary:

;;; Code:

(use-package which-key
  :ensure t
  :commands which-key
  :config
  (which-key-mode 1)

  (when (require 'vlf nil 'noerror)
    (which-key-enable-god-mode-support))
  :diminish which-key-mode
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-which-key.el ends here
