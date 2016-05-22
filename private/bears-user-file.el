;;; .bearsmacs.el --- user config file
;;; Commentary:

;;; Version: 1.0.3

;;; Code:

(defun bears-configurations ()
  "Bearsmacs configuration.  Do not add own new configuration here.
If you want you can do it in bears-user-init/config function"
  (setq
   ;; Set to <t> if you want to use default configurations.
   ;; or <nil> to set up own hooks or mix them with defaults
   ;; <M-x bears-configurations-list> to get list of all build-in configurations
   use-bears-default-configurations nil
   ;; Set to <t> if you want add default packages to install
   ;; If you want to choose ony a few of them use <bears-packages>
   ;; To get list of build-in packages run <M-x bears-packages-list>
   use-bears-default-packages nil
   ;; Write here name of theme you want to use.
   ;; To get list of all available themes run <M-x bears-theme-list>
   bears-theme ""
   ;; Write here the all packages you want to have installed.
   ;; To get list of all avaiable packages run <M-bears-package-list>
   ;; Command: <M-bears-update> will update emacs files and install packages.
   bears-packages '()
   )
  )

(defun bears-user-init()
  "This function will be evaluate before loading packages"
  )

(defun bears-user-config()
  "This function will be evaluate after loading packages"
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; .bearsmacs.el ends here
