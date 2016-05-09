;;; init.el --- emacs's initialize file
;;; Commentary:
;;; Code:

(defvar bears-packages nil)

;; == Disable loading of "default.el" at startup ===========================
(setq inhibit-default-init t)

;; == Turn off mouse interface early in startup to avoid momentary display =
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; == Enable visual feedback on selections =================================
(setq transient-mark-mode t)

;; == No splash screen please... jeez ======================================
(setq inhibit-startup-screen t)

;; == Add line number ======================================================
(global-linum-mode t)
(global-hl-line-mode t)
(column-number-mode t)

;; == Disable window's pipe delay ==========================================
(setq w32-pipe-read-delay 0)

;; == Short confirm ==
(fset 'yes-or-no-p 'y-or-n-p)

;; == Add .h files to c++-mode =============================================
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; == Default to unified diffs ================================================
(setq diff-switches "-u")

;; == Default to better frame titles ==========================================
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; == open window disable =====================================================
(setq split-height-threshold nil
      split-width-threshold nil)

;; == (set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>])) ==
(set-frame-parameter (selected-frame) 'alpha '(90 50))
(add-to-list 'default-frame-alist '(alpha 90 50))

;; == use Shift+arrow_keys to move cursor around split panes =====================
(windmove-default-keybindings)

;; == set auto-insert header
;; (auto-insert-mode)
;; (setq auto-insert-query nil)

;; (defun my/autoinsert-yas-expand()
;;       "Replace text in yasnippet template."
;;       (yas/expand-snippet (buffer-string) (point-min) (point-max)))

;; (custom-set-variables
;;  '(auto-insert 'other)
;;  '(auto-insert-directory "~/.emacs.d/templates/")
;;  '(auto-insert-alist '((("\\.hpp\\'" . "C++ header") . ["template.hpp" c++-mode my/autoinsert-yas-expand])
;;                        (("\\.cpp\\'" . "C++ source") . ["template.cpp" my/autoinsert-yas-expand]))))

;; == Set auto save files directory ===========================================
(setq temporary-file-directory "~/.emacs.d/tmp/")
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/emacs-autosaves/" t)))
(setq backup-directory-alist '((".*" . "~/.emacs.d/emacs-backups")))
(setq make-backup-files t
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t
      auto-save-timeout 20
      auto-save-interval 200
      delete-old-versions t
      )

;;; == load bears private config file ==
(add-to-list 'load-path "~/.emacs.d/private")
(require 'bears-packages)

;; == warm-night theme =========================================================
(setq custom-safe-themes t)

;;; == load bears private config file ==
(require 'bears-style)
(require 'bears-bind)

(add-hook 'emacs-lisp-mode-hook 'bears-lisp-style)

;;; == load user config file ==
(unless (file-exists-p "~/.bearsmacs.el")
  (write-region
   ";;; .bearsmacs.el --- user config file
;;; Commentary:
;;; Code:

(setq bears-packages '(company
                       irony
                       ido
                       clang-format
                       ggtags))

(defun bears-user-config()
  (defun c++-style()
    (bears-c++-style)
    (bears-c++-bind)
    (setq cc-search-directories '(\".\")
      )
    )
  (add-hook 'c++-mode-hook 'c++-style)
  )

(defun bears-user-theme()
  (use-package warm-night-theme)
  (load-theme 'warm-night t)
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; .bearsmacs.el ends here" nil "~/.bearsmacs.el" nil))

(load-file "~/.bearsmacs.el")
(bears-user-theme)
(while bears-packages
  (load-file
   (format "~/.emacs.d/private/packages/bears-%s.el" (pop bears-packages))))
(bears-user-config)

;;; init.el ends here
