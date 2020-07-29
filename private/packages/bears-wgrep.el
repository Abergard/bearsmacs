;;; bears-wgrep.el --- bears configuration file for wgrep

;;; Commentary:

;;; Code:

(use-package wgrep
  :config
  (setq wgrep-auto-save-buffer t
        wgrep-change-readonly-file t
        wgrep-enable-key "r")
  )

;;; bears-wgrep.el ends here
