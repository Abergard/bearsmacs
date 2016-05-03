;;; init.el --- emacs's initialize file
;;; Commentary:
;;; Code:

;; == uncomment below line to install all packages =============================
;; (setq use-package-always-ensure t)

;; == Disable loading of "default.el" at startup ==============================
(setq inhibit-default-init t)

;; == Turn off mouse interface early in startup to avoid momentary display ====
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; == Enable visual feedback on selections ====================================
(setq transient-mark-mode t)

;; == No splash screen please... jeez =========================================
(setq inhibit-startup-screen t)

;; == Add line number =========================================================
(global-linum-mode t)
(global-hl-line-mode t)
(column-number-mode t)

;; == Disable window's pipe delay =============================================
(setq w32-pipe-read-delay 0)

;; Short confirm
(fset 'yes-or-no-p 'y-or-n-p)

;; == Add .h files to c++-mode ================================================
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

;; == package & package-archives ===============================================
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; == paradox package =========================================================
(use-package paradox)

;; == warm-night theme =========================================================
(setq custom-safe-themes t)
(use-package warm-night-theme)
(load-theme 'warm-night t)

;; == whitespace ===============================================================
(use-package whitespace)

;; == clang-format ===========================================================
(use-package clang-format
  :config
;;    (setq clang-format-executable "clang-format.exe")
  :bind ("<C-return>" . clang-format-buffer)
  )

;; == flx-ido ===================================================================
(use-package flx-ido
  :init
    (ido-mode 1)
    (ido-everywhere 1)
    (flx-ido-mode 1)
  :config
    (setq ido-enable-flex-matching t)
    (setq ido-use-faces nil)
    (setq ido-use-filename-at-point nil)
    (setq ido-auto-merge-work-directories-length 0)
    (setq ido-use-virtual-buffers t)

    (use-package ido-ubiquitous
      :init
        (ido-ubiquitous-mode t)
    )
    (use-package smex
      :init
        (setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
        (global-set-key [remap execute-extended-command] 'smex)
    )
    (use-package idomenu
      :init
        (setq ido-default-buffer-method 'selected-window)
        (add-hook 'ido-setup-hook
          (lambda ()
            (define-key ido-completion-map [up] 'previous-history-element)
          )
        )
    )
)

;; == ido-hacks =============================================================
(use-package ido-hacks)

;; == ido complete for ggtags ===============================================
(setq ggtags-completing-read-function
  (lambda (&rest args)
    (apply #'ido-completing-read
     (car args)
     (all-completions "" ggtags-completion-table)
     (cddr args)
    )
  )
)

;; == irony-mode ============================================================
(use-package irony
  :init
  (add-hook 'c++-mode-hook 'irony-mode)
  :config
  ;; replace the `completion-at-point' and `complete-symbol' bindings in
  ;; irony-mode's buffers by irony-mode's function
  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  )

;; == company-mode ================================================================
(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (use-package company-irony)
  (use-package company-irony-c-headers)
  (setq
   company-idle-delay              0
   company-echo-delay              0
   company-minimum-prefix-length   1
   company-show-numbers            t
   company-tooltip-limit           20
   company-dabbrev-downcase        nil
   company-backends                '((company-irony-c-headers company-irony))
   company-begin-commands          '(self-insert-command)
   )
  :bind ("<M-return>" . company-complete-common)
  )

(require 'color)
(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default :background , (color-lighten-name bg 5)))))
   `(company-tooltip-search ((t (:background "steelblue" :foreground "white"))))
   `(company-tooltip-selection ((t (:background "steelblue" :foreground "white"))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))
   `(company-tooltip-annotation ((t (:inherit default :background , (color-lighten-name bg 5) :foreground "medium purple"))))))

;; == ido-at-point =========================================================
(use-package ido-at-point
  :config
  (ido-at-point-mode)
  )

;; == ggtags =========================================================================
(use-package ggtags
  :init
  (add-hook 'c++-mode-hook '(lambda () (ggtags-mode 1)))
  (add-hook 'c-mode-hook '(lambda () (ggtags-mode 1)))
  (add-hook 'ttcn-3-mode-hook '(lambda () (ggtags-mode 0)))
  :bind ("M-/" . ggtags-find-file)
  )

;; == yasnippet =============================================================
(use-package yasnippet
  :init
  (yas-global-mode 1)
  )

;; == iedit ====================================================================
(use-package iedit)

;; == flycheck-iron ============================================================
(use-package flycheck-irony
  :init
  (require 'flycheck-irony)
  (add-hook 'c++-mode-hook (lambda ()
			     (setq flycheck-clang-language-standard "c++14")))
  (add-hook 'after-init-hook #'global-flycheck-mode)

  (eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
)

;; == ttcn-mode ================================================================
(add-to-list 'load-path "~/.emacs.d/elpa/ttcn3")
(when (require 'ttcn3 nil 'noerror)
  (add-to-list 'auto-mode-alist '("\\.ttcn3?" . ttcn-3-mode) 't)
  (add-hook 'ttcn-3-mode-hook 'my-cc-style)
  )

;;; == load bears private config file ==
(add-to-list 'load-path "~/.emacs.d/private")

;;; == load user config file ==
(unless (file-exists-p "~/.bearsmacs.el")
  (write-region
   ";;; .bearsmacs.el --- user config file
;;; Commentary:
;;; Code:

(require 'bears-style)
(require 'bears-bind)

(defun c++-style()
  (bears-c++-style)
  (bears-c++-bind)
  )
(add-hook 'c++-mode-hook 'c++-style)

;;; .bearsmacs.el ends here" nil "~/.bearsmacs.el" nil))
(load-file "~/.bearsmacs.el")

;;; init.el ends here
