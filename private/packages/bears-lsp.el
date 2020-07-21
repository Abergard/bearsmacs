;;; bears-lsp.el --- local styles
;;; Commentary:

;;; Code:

(use-package lsp-mode
  :ensure t
  :commands lsp
  :init (setq lsp-auto-execute-action            nil
              lsp-auto-guess-root                nil
              lsp-before-save-edits              nil
              lsp-document-sync-method           nil
              lsp-eldoc-render-all               nil
              lsp-enable-completion-at-point     nil
              lsp-enable-file-watchers           nil
              lsp-enable-indentation             nil
              lsp-enable-on-type-formatting      nil
              lsp-enable-semantic-highlighting   nil
              lsp-enable-snippet                 nil
              lsp-enable-xref                    t
              lsp-imenu-show-container-name      nil
              lsp-imenu-sort-methods             nil
              lsp-inhibit-message                nil
              lsp-keep-workspace-alive           nil
              lsp-log-io                         t
              lsp-prefer-flymake                 :none
              lsp-print-performance              t
              lsp-report-if-no-buffer            nil
              lsp-response-timeout               5
              lsp-restart                        'interactive
              lsp-signature-render-all           nil
              lsp-keymap-prefix "C-c l"

              gc-cons-threshold 100000000
              read-process-output-max (* 1024 1024))
  :config
  :hook ((prog-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  )

(use-package lsp-ui
  :after lsp-mode
  :ensure t
  :commands lsp-ui
  :config
  ;; (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  ;; (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  )

(use-package company-lsp
  :after company
  :ensure t
  :commands company-lsp
  :init
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0)
  )
;; (use-package lsp-treemacs
;;   :after treemacs
;;   :ensure t
;;   )

;; Local Variables:
;; byte-compile-warnings: ()
;; End:

;;; bears-lsp.el ends here
