;;; init.el --- emacs's initialize file
;;; Commentary:
;;; Code:

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
 major-mode 'text-mode)

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
(set-frame-parameter (selected-frame) 'alpha '(90 50))
(add-to-list 'default-frame-alist '(alpha 90 50))

;; == use Shift+arrow_keys to move cursor around split panes ========
(windmove-default-keybindings)

(defun toggle-maximize-buffer ()
  "Maximize buffer."
  (interactive)
  (if (= 1 (length (window-list)))
      (jump-to-register '_)
    (progn
      (window-configuration-to-register '_)
      (delete-other-windows))))

(defvar use-bears-default-packages nil)
(defvar use-bears-default-configurations nil)
(defvar bears-packages nil)
(defvar bears-disabled-packages '())
(defvar bears-default-packages '(clang-format
                                 company
                                 flycheck
                                 flycheck-irony
                                 ggtags
                                 ido
                                 irony
                                 yasnippet
                                 rainbow-delimiters
                                 powerline
                                 git-gutter-fringe
                                 semantic
                                 anzu
                                 avy
                                 srefactor
                                 neotree
                                 cmake
                                 whitespace
                                 git-mode))
(defvar bears-theme "")

(defun bears-package-list ()
  "Function display all available packages."
  (interactive)
  (message (concat
                   "[ninja]"
                   "[ttcn3]"
                   "[elpy]"
                   "[rtags]"
                   "[flycheck-rtags]"
                   "[glsl]"
                   "[clang-format(default)]"
                   "[company(default)]"
                   "[flycheck(default)]"
                   "[flycheck-irony(default)]"
                   "[ggtags(default)]"
                   "[ido(default)]"
                   "[irony(default)]"
                   "[yasnippet(default)]"
                   "[rainbow-delimiters(default)]"
                   "[powerline(default)]"
                   "[git-gutter-fringe(default)]"
                   "[virtual-desktops]"
                   "[semantic(defautlt)]"
                   "[anzu(default)]"
                   "[avy(default)]"
                   "[srefactor(default)]"
                   "[neotree(default)]"
                   "[cmake(default)]"
                   "[whitespace(default)]"
                   "[git-mode](default)")))

(defun bears-theme-list ()
  "Function display all available themes."
  (interactive)
  (message (concat "[warm-night]"
                   "[zenburn]"
                   "[dracula]"
                   "[solarized-light]"
                   "[solarized-dark]"
                   "[forest-blue]")))

(defun bears-configuration-list ()
  "Dispplay all available configurations."
  (interactive)
  (message (concat "[bears-common-configuration]"
                   "[bears-prog-configuration]"
                   "[bears-c-configuration]"
                   "[bears-c++-configuration]"
                   "[bears-python-configuration]"
                   "[bears-ttcn3-configuration]")))

;;; == load bears private config file ==
(add-to-list 'load-path "~/.emacs.d/private")

;;; == user config file ==
(unless (file-exists-p "~/.bearsmacs.el")
  (copy-file "~/.emacs.d/private/bears-user-file.el" "~/.bearsmacs.el"))

(load-file "~/.bearsmacs.el")

(bears-configurations)
(bears-user-init)

(require 'bears-packages)

(unless (string= bears-theme "")
  (load-file (format "~/.emacs.d/private/themes/bears-%s.el" bears-theme)))

(require 'bears-style)
(require 'bears-bind)
(require 'bears-configuration)

(when use-bears-default-configurations
  (add-hook 'emacs-lisp-mode-hook 'bears-prog-configuration)
  (add-hook 'text-mode-hook 'bears-common-configuration)
  (add-hook 'sh-mode-hook 'bears-common-configuration)
  (add-hook 'c++-mode-hook 'bears-c++-configuration)
  (add-hook 'c-mode-hook 'bears-c-configuration)
  (add-hook 'python-mode-hook 'bears-python-configuration)
  (add-hook 'gitignore-mode-hook 'bears-common-configuration)
  (add-hook 'gitattributes-mode-hook 'bears-common-configuration)
  (add-hook 'gitconfig-mode-hook 'bears-common-configuration)
  (add-hook 'cmake-mode-hook 'bears-prog-configuration)
  (add-hook 'ninja-mode-hook 'bears-prog-configuration)
  (add-hook 'ttcn-3-mode-hook 'bears-ttcn3-configuration)
  (add-hook 'glsl-mode-hook 'bears-c-configuration))

(when use-bears-default-packages
  (setq bears-packages (append bears-packages bears-default-packages))
  )

(require 'cl)
(setq bears-packages (set-difference bears-packages bears-disabled-packages))

(while bears-packages
  (load-file
   (format "~/.emacs.d/private/packages/bears-%s.el" (pop bears-packages))))

(bears-user-config)

(defun bears-update ()
  "Function update packages."
  (interactive)
  (load-file "~/.emacs.d/init.el")
  (bears-color-style))

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (unless (string= bears-theme "")
                  (load-file (format "~/.emacs.d/private/themes/bears-%s.el" bears-theme)))
                )
              )
  )

;;; init.el ends here
