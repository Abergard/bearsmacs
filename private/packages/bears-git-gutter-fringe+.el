;;; bears-git-gutter-fringe+.el --- local styles
;;; Commentary:

;;; Code:

(use-package git-gutter-fringe+
  :config
  (require 'git-gutter-fringe+)
  (setq git-gutter-fr+-side 'right-fringe)
  (fringe-helper-define 'git-gutter-fr+-added nil
    "..X...."
    "..X...."
    "XXXXX.."
    "..X...."
    "..X....")

  (fringe-helper-define 'git-gutter-fr+-deleted nil
    "......."
    "......."
    "......."
    "XXXXX.."
    "......."
    "......."
    ".......")

  (fringe-helper-define 'git-gutter-fr+-modified nil
    "..X...."
    ".XXX..."
    "XX.XX.."
    ".XXX..."
    "..X....")

  (defadvice bears-prog-style (after bears-git-gutter-fringe+ activate)
    (git-gutter+-mode 1)
    )
  :diminish git-gutter+-mode
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-git-gutter-fringe+.el ends here
