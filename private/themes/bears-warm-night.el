;;; bears-warm-night.el --- local styles
;;; Commentary:

;;; Code:

(use-package warm-night-theme
  :config
  (load-theme 'warm-night t)
  (defadvice bears-color-style (after bears-theme activate)
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

  (when (require 'company nil 'noerror)
    (require 'color)
    (let ((bg (face-attribute 'default :background)))
      (custom-set-faces
       `(company-tooltip
         ((t (:inherit default :background , (color-lighten-name bg 5)))))

       `(company-tooltip-search
         ((t (:background "steelblue" :foreground "white"))))

       `(company-tooltip-selection
         ((t (:background "steelblue" :foreground "white"))))

       `(company-tooltip-common
         ((t (:inherit font-lock-constant-face))))

       `(company-tooltip-annotation
         ((t (:inherit default :background ,
                       (color-lighten-name bg 5) :foreground "medium purple")))))
      )
    )
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-warm-night.el ends here
