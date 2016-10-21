;;; bears-function.el --- local styles
;;; Commentary:

;;; Code:

(defun bears-package-list ()
  "Function display all available packages."
  (interactive)
  (completing-read
   "Available packages: "
   '(("ninja")
     ("ttcn3")
     ("elpy")
     ("rtags")
     ("flycheck-rtags")
     ("glsl")
     ("clang-format(default)")
     ("company(default)")
     ("flycheck(default)")
     ("flycheck-irony(default)")
     ("ggtags(default)")
     ("ido(default)")
     ("irony(default)")
     ("yasnippet(default)")
     ("rainbow-delimiters(default)")
     ("powerline(default)")
     ("git-gutter-fringe(default)")
     ("virtual-desktops")
     ("semantic(defautlt)")
     ("anzu(default)")
     ("avy(default)")
     ("srefactor(default)")
     ("neotree(default)")
     ("cmake(default)")
     ("whitespace(default)")
     ("git-mode(default)")
     ("which-key(default)")
     ("projectile(default)"))nil t "")
  )

(defun bears-get-theme-list()
  (completing-read
   "Available themes: "
   '(("warm-night")
     ("zenburn")
     ("dracula")
     ("solarized-light")
     ("solarized-dark")
     ("forest-blue"))nil t "")
  )

(defun bears-theme-list ()
  "Function display all available themes."
  (interactive)
  (bears-get-theme-list)
  )

(defun bears-configuration-list ()
  "Dispplay all available configurations."
  (interactive)
  (completing-read
   "Available configurations: "
   '(("bears-common-configuration")
     ("bears-prog-configuration")
     ("bears-c-configuration")
     ("bears-c++-configuration")
     ("bears-python-configuration")
     ("bears-ttcn3-configuration"))nil t "")
  )

(defun bears-update ()
  "Function update packages."
  (interactive)
  (load-file "~/.emacs.d/init.el")
  (bears-color-style))

(defun bears-load-theme-arg (theme)
  "Load THEME."
  (unless (string= theme "")
    (disable-theme bears-theme)
    (setq bears-theme theme)
    (load-file (format "~/.emacs.d/private/themes/bears-%s.el" theme)))
  )

(defun toggle-maximize-buffer ()
  "Maximize buffer."
  (interactive)
  (if (= 1 (length (window-list)))
      (jump-to-register '_)
    (progn
      (window-configuration-to-register '_)
      (delete-other-windows))))

 ;; (defun bears-load-theme ()
 ;;   (interactive)
 ;;   (bears-load-theme-arg (bears-theme-list))
 ;;   (bears-color-style)
 ;;   )

(provide 'bears-functions)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-functions.el ends here
