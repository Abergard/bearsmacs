;;; bears-warm-night.el --- local styles
;;; Commentary:

;;; Code:

(use-package warm-night-theme
  :config
  (load-theme 'warm-night t)
  (set-face-attribute 'vhl/default-face nil
                      :foreground "#262626"
                      :background "#969696")

  (set-face-attribute 'region nil
                      :foreground "#262626"
                      :background "#969696")

  (set-face-attribute 'show-paren-match nil
                      :foreground "thistle3"
                      :background "MediumPurple4"
                      :weight 'extra-bold)

  (when (require 'company nil 'noerror)
    (set-face-attribute 'company-tooltip nil
                        :foreground "#a1a1a1"
                        :background "#362f2f"
                        :weight 'bold
                        :inherit 'default)

    (set-face-attribute 'company-tooltip-search nil
                        :foreground "white"
                        :background "steelblue")

    (set-face-attribute 'company-tooltip-selection nil
                        :foreground "white"
                        :background "steelblue")

    (set-face-attribute 'company-tooltip-common nil
                        :foreground "#929292"
                        :inherit 'font-lock-constant-face)

    (set-face-attribute 'company-tooltip-annotation nil
                        :foreground "medium purple"
                        :background "#362f2f"
                        :inherit 'default)
    )
  (when (require 'anzu nil 'noerror)
    (set-face-attribute 'anzu-mode-line nil
                        :foreground "yellow" :weight 'bold)
    )
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-warm-night.el ends here
