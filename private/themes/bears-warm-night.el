;;; bears-warm-night.el --- local styles
;;; Commentary:

;;; Code:

(use-package warm-night-theme
  :config
  (load-theme 'warm-night t)
  (defadvice bears-color-style (after bears-color-style-after activate)
    (set-face-attribute 'vhl/default-face nil
                        :foreground nil
                        :background "#161616")

    (set-face-attribute 'region nil
                        :foreground nil
                        :background "#161616")

    (set-face-attribute 'show-paren-match nil
                        :foreground "thistle3"
                        :background "MediumPurple4"
                        :weight 'extra-bold)
    )
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-warm-night.el ends here
