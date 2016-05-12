;;; bears-ido.el --- local styles
;;; Commentary:

;;; Code:

(use-package flx-ido
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (flx-ido-mode 1)

  (setq ido-enable-flex-matching t)
  (setq ido-use-faces nil)
  (setq ido-use-filename-at-point nil)
  (setq ido-auto-merge-work-directories-length 0)
  (setq ido-use-virtual-buffers t)

  (use-package ido-ubiquitous
    :config
    (ido-ubiquitous-mode t)
    )
  (use-package smex
    :config
    (setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
    (global-set-key [remap execute-extended-command] 'smex)
    )
  (use-package idomenu
    :config
    (setq ido-default-buffer-method 'selected-window)
    (add-hook 'ido-setup-hook
              (lambda ()
                (define-key ido-completion-map [up] 'previous-history-element)
                )
              )
    )
  )
(use-package ido-at-point
  :config
  (ido-at-point-mode)
  )
(use-package ido-hacks)

(when (require 'ggtags nil :noerror)
  (setq ggtags-completing-read-function
        (lambda (&rest args)
          (apply #'ido-completing-read
                 (car args)
                 (all-completions "" ggtags-completion-table)
                 (cddr args)
                 )
          )
        )
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-ido.el ends here
