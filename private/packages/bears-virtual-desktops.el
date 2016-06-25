;;; bears-virtual-desktops.el --- local styles
;;; Commentary:

;;; Code:

(add-to-list 'load-path "~/.emacs.d/elpa/virtual-desktops")
(when (require 'virtual-desktops)
  (virtual-desktops-mode 1)
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-virtual-desktops.el ends here
