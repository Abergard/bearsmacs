;;; bears-lsp.el --- local styles
;;; Commentary:

;;; Code:

(use-package posframe)
(use-package lsp-mode
  :commands lsp
  :init (setq
              ;; lsp-auto-execute-action            nil
              ;; lsp-auto-configure                 t
              ;; lsp-auto-guess-root                nil
              ;; lsp-before-save-edits              nil
              ;; lsp-document-sync-method           nil
              ;; lsp-eldoc-render-all               nil
              ;; lsp-completion-enable              t
              ;; lsp-enable-file-watchers           nil
              ;; lsp-enable-indentation             nil
              ;; lsp-enable-on-type-formatting      nil
              ;; lsp-semantic-tokens-enable         t
              ;; lsp-enable-snippet                 t
              ;; lsp-enable-xref                    t
              ;; lsp-imenu-show-container-name      t
              ;; lsp-imenu-sort-methods             t
              ;; lsp-inhibit-message                nil
              ;; lsp-keep-workspace-alive           t
              ;; lsp-log-io                         nil
              ;; lsp-prefer-flymake                 :none
              ;; lsp-print-performance              nil
              ;; lsp-report-if-no-buffer            nil
              ;; lsp-response-timeout               15
              ;; lsp-idle-delay                     0.1
              ;; lsp-restart                        'interactive
              lsp-keymap-prefix "C-c l"

              ;; gc-cons-threshold (* 100 1024 1024)
              ;; read-process-output-max (* 1024 1024)
              )
  :config
  :hook ((prog-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :bind (:map c++-mode-map
              ("<C-return>" . lsp-format-buffer))
  )

(use-package lsp-ui
  :after lsp-mode
  :commands lsp-ui
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)

  (defun lsp-ui-peek--peek-display (src1 src2)
    (-let* ((win-width (frame-width))
            (lsp-ui-peek-list-width (/ (frame-width) 2))
            (string (-some--> (-zip-fill "" src1 src2)
                      (--map (lsp-ui-peek--adjust win-width it) it)
                      (-map-indexed 'lsp-ui-peek--make-line it)
                      (-concat it (lsp-ui-peek--make-footer))))
            )
      (setq lsp-ui-peek--buffer (get-buffer-create " *lsp-peek--buffer*"))
      (message "Kabuum setup buffer in display...")
      (message "Kabuum setup buffer:%s" lsp-ui-peek--buffer)
      (posframe-show lsp-ui-peek--buffer
                     :string (mapconcat 'identity string "")
                     :min-width (frame-width)
                     :poshandler #'posframe-poshandler-frame-center)))

  (defun lsp-ui-peek--peek-destroy ()
    (message "Kabuum setup buffer in destroy...")
    (when (and (boundp 'lsp-ui-peek--buffer) (bufferp lsp-ui-peek--buffer))
      (message "Kabuum destroying buffer:%s" lsp-ui-peek--buffer)
      (posframe-hide lsp-ui-peek--buffer))
    (setq lsp-ui-peek--buffer nil
          lsp-ui-peek--last-xref nil)
    (set-window-start (get-buffer-window) lsp-ui-peek--win-start))

  (advice-add #'lsp-ui-peek--peek-new :override #'lsp-ui-peek--peek-display)
  (advice-add #'lsp-ui-peek--peek-hide :override #'lsp-ui-peek--peek-destroy)
  )

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

;; (use-package dap-mode)
;; (with-eval-after-load 'lsp-mode
;;   (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
;;   (require 'dap-cpptools)
;;   (yas-global-mode))

;; ;; Uncomment the next line if you are using this from source
;; ;; (add-to-list 'load-path "<path-to-lsp-docker-dir>")
;; (require 'lsp-docker)

;; (defvar lsp-docker-client-packages
;;     '(lsp-css lsp-clients lsp-bash lsp-go lsp-pylsp lsp-html lsp-typescript
;;       lsp-terraform lsp-clangd))

;; (setq lsp-docker-client-configs
;;     '((:server-id bash-ls :docker-server-id bashls-docker :server-command "bash-language-server start")
;;       (:server-id clangd :docker-server-id clangd-docker :server-command "clangd")
;;       (:server-id css-ls :docker-server-id cssls-docker :server-command "css-languageserver --stdio")
;;       (:server-id dockerfile-ls :docker-server-id dockerfilels-docker :server-command "docker-langserver --stdio")
;;       (:server-id gopls :docker-server-id gopls-docker :server-command "gopls")
;;       (:server-id html-ls :docker-server-id htmls-docker :server-command "html-languageserver --stdio")
;;       (:server-id pylsp :docker-server-id pyls-docker :server-command "pylsp")
;;       (:server-id ts-ls :docker-server-id tsls-docker :server-command "typescript-language-server --stdio")))

;; (require 'lsp-docker)
;; (lsp-docker-init-clients
;;   :path-mappings '(("/var/fpwork/lzawisto/repo/gnb/" . "/projects"))
;;   :client-packages lsp-docker-client-packages
;;   :client-configs lsp-docker-client-configs)

;; Local Variables:
;; byte-compile-warnings: ()
;; End:

;;; bears-lsp.el ends here
