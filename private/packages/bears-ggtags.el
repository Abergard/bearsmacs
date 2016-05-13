;;; bears-ggtags.el --- local styles
;;; Commentary:

;;; Code:

(use-package ggtags
  :config
  (defadvice bears-prog-style (after bears-ggtags activate)
    (ggtags-mode 1)
    )

  (defadvice bears-ttcn3-style (after bears-ggtags activate)
    (ggtags-mode 0)
    )

  :bind ("M-/" . ggtags-find-file)
  :diminish ggtags-mode
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-ggtags.el ends here
