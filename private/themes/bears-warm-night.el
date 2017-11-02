;;; bears-warm-night.el --- local styles
;;; Commentary:

;;; Code:

(use-package warm-night-theme
  :config
  (load-theme 'warm-night t)
  (let ((class '((class color) (min-colors 89))))
  (custom-theme-set-faces
   'warm-night
   `(powerline-active1 ((,class (:inherit mode-line
                                 :foreground nil
                                 :background "grey17"))))
   `(powerline-active2 ((,class (:inherit mode-line
                                 :foreground nil
                                 :background "grey40"))))
   `(cursor ((,class (:background "#b680b1"))))
   `(vhl/default-face ((,class (:foreground "#262626"
                                :background "#969696"))))
   `(region ((,class (:foreground "#262626"
                      :background "#969696"))))
   `(show-paren-match ((,class (:foreground "thistle3"
                                :background "MediumPurple4"
                                :weight extrabold
                                ))))
   `(company-tooltip ((,class (:inherit 'default
                               :foreground "#a1a1a1"
                               :background "#362f2f"
                               :weight bold))))
   `(comapny-tooltip-search ((,class (:foreground "white"
                                      :background "steelblue"))))
   `(company-tooltip-selection ((,class (:foreground "white"
                                         :background "steelblue"))))
   `(company-tooltip-common ((,class (:inherit 'font-lock-constant-face
                                      :foreground "#929292"))))
   `(company-tooltip-annotation ((,class (:inherit 'default
                                          :foreground "medium purple"
                                          :background "#362f2f"))))
   `(anzu-mode-line ((,class (:foreground nil
                              :weight bold))))
   `(persp-selected-face ((,class (:inherit 'mode-line-buffer-id
                                   :foreground nil
                                   :weight bold))))
   ))

  );;todo read http://emacs.stackexchange.com/questions/3323/is-there-any-way-to-run-a-hook-function-only-once

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-warm-night.el ends here
