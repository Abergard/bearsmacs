;;; bears-styles.el --- local styles
;;; Commentary:

;;; Code:

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(add-to-list 'command-switch-alist '("-check_packages" .
                     (lambda (switch)
                       ((setq use-package-always-ensure t)))))

(require 'diminish)
(require 'bind-key)

(use-package paradox)
(use-package iedit)
(use-package whitespace
  :diminish whitespace-mode)

(use-package yasnippet
  :init
  (yas-global-mode 1)
  :diminish yas-minor-mode)

(provide 'bears-packages)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-packages.el ends here
