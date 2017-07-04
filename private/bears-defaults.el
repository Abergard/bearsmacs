;;; bears-defaults.el --- local styles
;;; Commentary:

;;; Code:

(require 'bears-variables)

(setq-default
 tab-width 4
 ;;Disable loading of "default.el" at startup
 inhibit-default-init t
 indent-tabs-mode nil
 ;;Enable visual feedback on selection.
 transient-mark-mode t
 ;; == No splash screen please... jeez.
 inhibit-startup-screen t
 ;; == Disable window's pipe delay.
 w32-pipe-read-delay 0
 ;; == Default to unified diffs.
 diff-switches "-u"
 ;; == Default to better frame titles.
 frame-title-format (concat  "%b - emacs@" (system-name))
 ;; == open window disable.
 split-height-threshold nil
 split-width-threshold nil
 ;;Set auto save files directory.
 temporary-file-directory "~/.emacs.d/tmp/"
 auto-save-file-name-transforms '((".*" "~/.emacs.d/emacs-autosaves/" t))
 backup-directory-alist '((".*" . "~/.emacs.d/emacs-backups"))
 make-backup-files t
 backup-by-copying t
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t
 auto-save-timeout 20
 auto-save-interval 200
 delete-old-versions t
 custom-safe-themes t
 major-mode 'text-mode
 compilation-scroll-output 'first-error
 custom-file "~/.emacs.d/custom.el"
 package-enable-at-startup nil)

;; == Turn off mouse interface early in startup to avoid momentary display =
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(defadvice load-theme (before disable-themes-first activate)
  "Disable theme before load new one."
  "disable all active themes."
  (dolist (i custom-enabled-themes)
    (disable-theme i)))

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; == selected region will be deleted ==
(delete-selection-mode 1)

;; == Short confirm ==
(fset 'yes-or-no-p 'y-or-n-p)

;; == Add .h files to c++-mode =======================================
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; == (set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>])) ==
(set-frame-parameter (selected-frame) 'alpha '(90 30))
(add-to-list 'default-frame-alist '(alpha 90 50))

;; == use Shift+arrow_keys to move cursor around split panes ========
(windmove-default-keybindings)

(setq bears-default-packages '(clang-format
                               company
                               flycheck
                               ggtags
                               ido
                               yasnippet
                               rainbow-delimiters
                               powerline
                               git-gutter-fringe
                               anzu
                               avy
                               neotree
                               cmake
                               whitespace
                               git-mode
                               which-key
                               projectile
                               vdiff
                               perspective
                               multiple-cursors
                               ))

(provide 'bears-defaults)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-defaults.el ends here
