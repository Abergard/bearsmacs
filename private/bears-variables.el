;;; bears-variables.el --- local styles
;;; Commentary:

;;; Code:

(defvar use-bears-default-packages nil)
(defvar use-bears-default-configurations nil)
(defvar bears-packages nil)
(defvar bears-disabled-packages '())
(defvar bears-default-packages '(clang-format
                                 company
                                 flycheck
                                 flycheck-irony
                                 ggtags
                                 ido
                                 irony
                                 yasnippet
                                 rainbow-delimiters
                                 powerline
                                 git-gutter-fringe
                                 semantic
                                 anzu
                                 avy
                                 srefactor
                                 neotree
                                 cmake
                                 whitespace
                                 git-mode
                                 which-key
                                 projectile
                                 vdiff
                                 perspective
                                 multiple-cursors
                                 irony-eldoc
                                 company-irony))
(defvar bears-theme "")

(provide 'bears-variables)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-variables.el ends here
