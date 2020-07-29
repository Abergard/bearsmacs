;;; .bearsmacs.el --- user config file
;;; Commentary:
;;; Code:

(setq bears--user-file-version "1.1.0")

(defun bears-configurations ()
  "Bearsmacs configuration.  Do not add own new configuration here.
If you want you can do it in bears-user-init/config function"
  (setq
   ;; Set to <t> if you want to use default configurations.
   ;; or <nil> to set up own hooks or mix them with defaults
   ;; <M-x bears-configurations-list> to get list of all build-in configurations
   use-bears-default-configurations t

   ;; Set to <t> if you want add default packages to install
   ;; If you want to choose ony a few of them use <bears-packages>
   ;; To get list of build-in packages run <M-x bears-packages-list>
   use-bears-default-packages t

   ;; Write here name of theme you want to use.
   ;; To get list of all available themes run <M-x bears-theme-list>
   bears-gui-theme "warm-night"
   bears-terminal-theme "warm-night"

   ;; Write here the all packages you want to have installed.
   ;; To get list of all avaiable packages run <M-bears-package-list>
   ;; Command: <M-bears-update> will update emacs files and install packages.
   bears-packages '()

   ;; Write here the all packages you want to have disabled.
   bears-disabled-packages '()
   )
  )

(defun bears-user-init()
  "This function will be evaluate before loading packages."

  ;; uncomment the line below to ignore emacs 26.2 signature error
  ;; ------------------------------------------------------------
  ;; (setq package-check-signature nil)

  ;; uncomment the line below if want to see a menu bar
  ;; ------------------------------------------------------------
  ;; (when (fboundp 'menu-bar-mode) (menu-bar-mode 1))
  )

(defun bears-user-config()
  "This function will be evaluate after loading packages."

  ;; uncomment the line below if you use .h files as a c++ header
  ;; ------------------------------------------------------------
  ;; (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

  ;; a sample of configuration
  ;; ------------------------------------------------------------
  ;; (setq projectile-git-submodule-command nil
  ;;       whitespace-line-column 119
  ;;       whitespace-style '(face tabs trailing lines-tail)
  ;;       treemacs-width 55
  ;;       treemacs--icon-size 12
  ;;       projectile-enable-caching t
  ;;       )

  ;; (projectile-register-project-type 'uwem '("marker_file")
  ;;                                   :compile "cmake --build ."
  ;;                                   :test "ctest -V"
  ;;                                   :run "./run"
  ;;                                   :test-suffix "Test")

  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; .bearsmacs.el ends here
