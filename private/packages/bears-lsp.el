;;; bears-lsp.el --- local styles
;;; Commentary:

;;; Code:

(use-package lsp-mode
  :ensure t
  :hook (prog-mode . lsp)
  :config

  (setq lsp-prefer-flymake nil)

<<<<<<< HEAD
  ;; (use-package lsp-ui
  ;;   :ensure t
  ;;   :config
  ;;   (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  ;;   (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  ;;   )
=======
  (use-package lsp-ui
    :ensure t
    :config
    (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
    (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
    )
>>>>>>> ff026f28fdcb4d95361f90b0e89ff004faa4f31e

  (use-package company-lsp
    :after company
    :ensure t
    )

<<<<<<< HEAD
 ;; (use-package lsp-treemacs
 ;;   :after treemacs
 ;;   :ensure t
 ;;   )
=======
  (use-package lsp-treemacs
    :after treemacs
    :ensure t
    )
>>>>>>> ff026f28fdcb4d95361f90b0e89ff004faa4f31e
  )

;; Local Variables:
;; byte-compile-warnings: ()
;; End:

;;; bears-lsp.el ends here
