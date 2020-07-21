;;; bears-warm-night.el --- local styles
;;; Commentary:

;;; Code:

(use-package warm-night-theme
  :config
  (load-theme 'warm-night)
  (let ((class '((class color) (min-colors 89))))
    (custom-set-faces
     '(powerline-active1                ((,class (:inherit mode-line :foreground nil :background "grey17"))))
     '(powerline-active2                ((,class (:inherit mode-line :foreground nil :background "grey40"))))
     '(cursor                           ((t (:background "#b680b1"))))
     '(vhl/default-face                 ((t (:foreground "#262626" :background "#969696"))))
     '(region                           ((t (:foreground "#262626" :background "#969696"))))
     '(show-paren-match                 ((t (:foreground "thistle3" :background "MediumPurple4" :weight extrabold))))
     '(comapny-tooltip-search           ((,class (:foreground "white" :background "steelblue"))))
     '(anzu-mode-line                   ((,class (:foreground nil :weight bold))))
     '(persp-selected-face              ((t (:inherit 'mode-line-buffer-id :foreground nil :weight bold))))
     '(term-color-black                 ((,class (:foreground "white smoke" :background "white smoke"))))
     '(centaur-tabs-unselected          ((,class (:background "gray20" :foreground "grey50"))))
     '(centaur-tabs-default             ((,class (:background "gray20" :foreground "grey50"))))
     '(centaur-tabs-selected            ((,class (:foreground "#292424" :background "#b680b1"))))
     '(centaur-tabs-selected-modified   ((,class (:foreground "#292424" :background "#b680b1"))))
     '(centaur-tabs-unselected-modified ((,class (:background "gray20" :foreground "grey50"))))
     '(iedit-occurrence                 ((t (:inherit highlight :foreground "#b680b1"))))
     )
    )

  (custom-set-faces
   '(company-tooltip                  ((t (:inherit 'default :foreground "#a1a1a1" :background "#362f2f" :weight bold))))
   '(comapny-tooltip-search           ((t (:foreground "white" :background "steelblue"))))
   '(company-tooltip-selection        ((t (:foreground "white" :background "steelblue"))))
   '(company-tooltip-common           ((t (:inherit 'font-lock-constant-face :foreground "#929292"))))
   '(company-tooltip-annotation       ((t (:inherit 'default :foreground "medium purple" :background "#362f2f"))))
   )

  (custom-set-faces
   '(lsp-ui-sideline-current-symbol   ((t (:foreground "#b680b1" :box (:line-width -1 :color "white") :weight semi-bold :height 0.99))))
   '(lsp-ui-sideline-symbol           ((t (:foreground "grey" :box (:line-width -1 :color "grey") :weight semi-bold :height 0.99))))
   '(lsp-ui-sideline-symbol-info      ((t (:foreground "wheat3" :slant italic :height 0.99))))
   )
  );;todo read http://emacs.stackexchange.com/questions/3323/is-there-any-way-to-run-a-hook-function-only-once

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-warm-night.el ends here
