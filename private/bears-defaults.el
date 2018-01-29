;;; bears-defaults.el --- local styles
;;; Commentary:

;;; Code:

(require 'bears-variables)

(setq-default
 auto-save-file-name-transforms '((".*" "~/.emacs.d/emacs-autosaves/" t))
 auto-save-interval 200
 auto-save-timeout 20
 backup-by-copying t
 backup-directory-alist '((".*" . "~/.emacs.d/emacs-backups"))
 bears-default-packages '(clang-format
                          company
                          flycheck
                          ido
                          yasnippet
                          rainbow-delimiters
                          powerline
                          git-gutter-fringe
                          anzu
                          avy
                          treemacs
                          cmake
                          whitespace
                          git-mode
                          vdiff
                          perspective
                          projectile
                          persp-projectile
                          multiple-cursors
                          beacon
                          vlf
                          latex-preview-pane
                          which-key)
 compilation-scroll-output 'first-error
 custom-file "~/.emacs.d/custom.el"
 custom-safe-themes t
 delete-old-versions t
 delete-old-versions t
 diff-switches "-u" ;Default to unified diffs.
 frame-title-format (concat  "%b - emacs@" (system-name)) ;Default to better frame titles.
 setq font-lock-maximum-decoration '((c-mode . t) (c++-mode . 2) (t . 1)) ;speedup  font-lock for c++ mode
 indent-tabs-mode nil
 inhibit-default-init t ;Disable loading of "default.el" at startup
 inhibit-startup-screen t ;No splash screen please... jeez.
 kept-new-versions 6
 kept-old-versions 2
 major-mode 'text-mode
 make-backup-files t
 package-enable-at-startup nil
 set-default-coding-systems 'utf-8
 set-language-environment "UTF-8"
 split-height-threshold nil ;open window disable.
 split-width-threshold nil
 tab-width 4
 temporary-file-directory "~/.emacs.d/tmp/" ;Set auto save files directory.
 transient-mark-mode t ;;Enable visual feedback on selection.
 version-control t
 w32-pipe-read-delay 0 ;Disable window's pipe delay.
 utf-translate-cjk-mode nil ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
 locale-coding-system 'utf-8
 doc-view-continuous t
 x-select-enable-clipboard t
  )

;Turn off mouse interface early in startup to avoid momentary display
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(delete-selection-mode 1) ;selected region will
(global-linum-mode t) ;enable global line numer
(add-hook 'doc-view-mode-hook (lambda ()(linum-mode -1))) ;disable global line num for docs
(windmove-default-keybindings) ;use Shift+arrow_keys to move cursor around split panes

(set-language-environment 'utf-8)
(set-keyboard-coding-system 'utf-8-mac) ; For old Carbon emacs on OS X only
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(unless (eq system-type 'windows-nt)
  (set-selection-coding-system 'utf-8))
(prefer-coding-system 'utf-8)

(fset 'yes-or-no-p 'y-or-n-p) ;Short confirm
(set-frame-parameter (selected-frame) 'alpha '(100 100)) ;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
(add-to-list 'default-frame-alist '(alpha 100 100))
(add-to-list 'auto-mode-alist '("\\.[ch]\\(pp\\|\\|\\+\\+\\)\\'" . c++-mode)) ;Add .c .h .hpp .cpp files to c++-mode

(defadvice load-theme (before disable-themes-first activate)
  "Disable theme before load new one."
  "disable all active themes."
  (dolist (i custom-enabled-themes)
    (disable-theme i)))

(provide 'bears-defaults)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-defaults.el ends here
