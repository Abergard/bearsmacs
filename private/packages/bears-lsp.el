;;; bears-lsp.el --- local styles
;;; Commentary:

;;; Code:

(use-package lsp-mode
  :commands lsp
  :init (setq lsp-auto-execute-action            nil
              lsp-auto-configure                 t
              lsp-auto-guess-root                nil
              lsp-before-save-edits              nil
              lsp-document-sync-method           nil
              lsp-eldoc-render-all               nil
              lsp-completion-enable              t
              lsp-enable-file-watchers           nil
              lsp-enable-indentation             nil
              lsp-enable-on-type-formatting      nil
              lsp-semantic-tokens-enable         t
              lsp-enable-snippet                 t
              lsp-enable-xref                    t
              lsp-imenu-show-container-name      t
              lsp-imenu-sort-methods             t
              lsp-inhibit-message                nil
              lsp-keep-workspace-alive           t
              lsp-log-io                         nil
              lsp-prefer-flymake                 :none
              lsp-print-performance              nil
              lsp-report-if-no-buffer            nil
              lsp-response-timeout               15
              lsp-idle-delay                     0.1
              lsp-restart                        'interactive
              lsp-keymap-prefix "C-c l"

              gc-cons-threshold (* 100 1024 1024)
              read-process-output-max (* 1024 1024))
  :config
  :hook ((prog-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  )

;; (use-package lsp-ui
;;   :after lsp-mode
;;   :commands lsp-ui
;;   :config
;;   ;; (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
;;   ;; (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
;;   )

;; FIXME: no company-lsp
;; (use-package company-lsp
;;   :after company
;;   :commands company-lsp
;;   :init
;;   (setq company-minimum-prefix-length 1
;;         company-idle-delay 0.0)
;;   )
;; (use-package lsp-treemacs
;;   :after treemacs
;;   )

(use-package dap-mode)
(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode))

;; Local Variables:
;; byte-compile-warnings: ()
;; End:

;;; bears-lsp.el ends here
