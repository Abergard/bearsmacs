;;; bears-git-gutter-fringe+.el --- local styles
;;; Commentary:

;;; Code:

(use-package git-gutter-fringe
  :config
  (setq
   git-gutter:handled-backends '(git svn)
   git-gutter-fr:side 'left-fringe
   )
  (fringe-helper-define 'git-gutter-fr:added nil
    "..X...."
    "..X...."
    "XXXXX.."
    "..X...."
    "..X....")

  (fringe-helper-define 'git-gutter-fr:deleted nil
    "......."
    "......."
    "......."
    "XXXXX.."
    "......."
    "......."
    ".......")

  (fringe-helper-define 'git-gutter-fr:modified nil
    "..X...."
    ".XXX..."
    "XX.XX.."
    ".XXX..."
    "..X....")

  (defadvice bears-prog-style (after bears-git-gutter-fringe activate)
    (git-gutter-mode 1)
    (fringe-mode '(8 . 0))
    )
  :diminish git-gutter-mode
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-git-gutter-fringe+.el ends here
