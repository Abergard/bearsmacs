;;; bears-auto-update.el --- bears configuration file for auto-update
;;; Commentary:
;;; Code:

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t
        auto-package-update-hide-results t)
  (auto-package-update-maybe)
  )

;;; bears-auto-update.el ends here
