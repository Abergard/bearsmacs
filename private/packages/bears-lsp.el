;;; bears-lsp.el --- local styles
;;; Commentary:

;;; Code:

(use-package lsp-mode
  :ensure t
  :init (setq lsp-keymap-prefix "C-c l")
  :hook ((prog-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :config


  (setq lsp-prefer-flymake nil)
  (setq lsp-clients-clangd-args '("--pch-storage=memory"
                                  "--background-index"
                                  "--clang-tidy"
                                  "--completion-style=detailed"
                                  "-j=10"
                                  "--log=error"
                                  "--header-insertion=iwyu"))
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  ;; (use-package lsp-ui
  ;;   :ensure t
  ;;   :config
  ;;   (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  ;;   (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  ;;   )

  (use-package company-lsp
    :after company
    :ensure t
    :commands company-lsp
    :config
    (setq company-minimum-prefix-length 1
          company-idle-delay 0.0) ;; default is 0.2
    )
  ;; (use-package lsp-treemacs
  ;;   :after treemacs
  ;;   :ensure t
  ;;   )
  )

;; Local Variables:
;; byte-compile-warnings: ()
;; End:

;;; bears-lsp.el ends here
