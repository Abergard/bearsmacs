;;; bears-godot.el --- local styles
;;; Commentary:

;;; Code:

(use-package gdscript-mode
    :bind (:map gdscript-mode-map
              ("<C-return>" . gdscript-format-buffer))
  )

;; Local Variables:
;; byte-compile-warnings: ()
;; End:

;;; bears-godot.el ends here
