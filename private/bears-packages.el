;;; bears-styles.el --- local styles
;;; Commentary:

;;; Code:

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("gnu" .
                                 "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" .
                                 "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" .
                                 "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" .
                                 "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("elpy" .
                                 "https://jorgenschaefer.github.io/packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t)

(use-package paradox
  :config
  (setq paradox-github-token t))

(use-package async)
(use-package window-numbering)
(use-package iedit)
(use-package volatile-highlights
  :diminish volatile-highlights-mode
  )

(provide 'bears-packages)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-packages.el ends here
