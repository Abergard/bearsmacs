;;; bears-ggtags.el --- local styles
;;; Commentary:

;;; Code:

(use-package ggtags
  :init
  (defadvice bears-base-style
      (after bears-base-style-after activate)
    (ggtags-mode 1))

  (defadvice bears-ttcn3-style
      (after bears-ttcn3-style-after activate)
    (ggtags-mode 0))

  :bind ("M-/" . ggtags-find-file)
  :diminish ggtags-mode
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-ggtags.el ends here
