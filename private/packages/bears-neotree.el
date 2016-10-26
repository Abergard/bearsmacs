;;; bears-neotree.el --- local styles
;;; Commentary:

;;; Code:

(use-package neotree
  :config
  (setq neo-window-width 25
        neo-window-fixed-size nil
        neo-persist-show nil
        neo-smart-open t
        neo-theme 'classic)

  ;; (defadvice neotree-toggle (after bears-fit-buffer)
  ;;   (fit-window-to-buffer)
  ;;   )
  (defun neotree-resize-window (&rest _args)
    "Resize neotree window."
    (interactive)
    (neo-buffer--with-resizable-window
     (let ((fit-window-to-buffer-horizontally t))
       (fit-window-to-buffer))))

  (add-hook 'neo-enter-hook #'neotree-resize-window)
  ;;(add-hook 'neo-change-root-hook #'neotree-resize-window)

  :bind ("<f8>" . neotree-toggle)
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-neotree.el ends here
