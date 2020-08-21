;;; bears-styles.el --- local styles
;;; Commentary:

;;; Code:

(require 'package)

(setq package-enable-at-startup nil
      package-check-signature nil)

(add-to-list 'package-archives '("gnu" .
                                 "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" .
                                 "http://melpa.org/packages/"))
(add-to-list 'package-archives '("elpy" .
                                 "http://jorgenschaefer.github.io/packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(let ((default-directory  "~/.emacs.d/github/"))
  (normal-top-level-add-subdirs-to-load-path))

(provide 'bears-packages)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-packages.el ends here
