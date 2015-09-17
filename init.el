
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
(column-number-mode t)

;; == Disable window's pipe delay =============================================
(setq w32-pipe-read-delay 0)

;;
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

;; == Set auto save files directory ===========================================
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/emacs-autosaves/" t)))
(setq backup-directory-alist '((".*" . "~/.emacs.d/emacs-backups")))
(setq make-backup-files t
      backup-by-copying t
      delete-old-version t
      kept-new-version 6
      kept-old-versions 2
      version-control t
      auto-save-timeout 20
      auto-save-interval 200
      delete-old-versions t
      )

;; == package & package-archives ===============================================
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; == warm-night theme =========================================================
(use-package warm-night-theme
  :ensure t
  :config
    (setq custom-safe-themes t)
    (load-theme 'warm-night)
)

;; == whitespace ===============================================================
(use-package whitespace
  :ensure t
  :init
    (setq whitespace-style '(face tabs empty trailing lines-tail))
    (setq whitespace-line-column 100)
    (global-whitespace-mode 1)
)

;; == my-cc-style ==============================================================
(require 'cc-mode)
(defun my-cc-style()
  (local-set-key [C-tab] 'ff-get-other-file)
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  (c-set-style "linux")
  (c-set-offset 'innamespace '0)
  (c-set-offset 'inextern-lang '0)
  (c-set-offset 'inline-open '0)
  (c-set-offset 'label '*)
  (c-set-offset 'case-label '*)
 ;(c-set-offset 'access-label '/)
  (setq c-basic-offset 4)
  (defvar c-hanging-braces-alist '(
    (substatement-open)
    (block-close . c-snug-do-while)
    (extern-lang-open after)
    (inexpr-class-open after)
    (inexpr-class-close before)
  ))
  (defvar c-offsets-alist '(
    (substatement-open . 0)
  ))
)
(add-hook 'c++-mode-hook 'my-cc-style)

;; == flx-ido ===================================================================
(use-package flx-ido
  :ensure t
  :defer t
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
      :ensure t
      :defer t
      :init
        (ido-ubiquitous-mode t)
    )
    (use-package smex
      :ensure t
      :defer t
      :init
        (setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
        (global-set-key [remap execute-extended-command] 'smex)
    )
    (use-package idomenu
      :ensure t
      :defer t
      :init
        (setq ido-default-buffer-method 'selected-window)
        (add-hook 'ido-setup-hook
          (lambda ()
            (define-key ido-completion-map [up] 'previous-history-element)
          )
        )
    )
)

;; == ido-hacks ==================================================================
(use-package ido-hacks
  :ensure t
  :defer t
)

;; == ido complete for ggtags ====================================================
(setq ggtags-completing-read-function
  (lambda (&rest args)
    (apply #'ido-completing-read
     (car args)
     (all-completions "" ggtags-completion-table)
     (cddr args)
    )
  )
)

;; == irony-mode =================================================================
(use-package irony
  :ensure t
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
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (use-package company-irony
    :ensure t
  )
  (use-package company-irony-c-headers
    :ensure t
    )
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
  :bind ("M-RET" . company-complete-common)
  )

(require 'color)
(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default :background , (color-lighten-name bg 5)))))
   `(company-tooltip-search ((t (:background "steelblue" :foreground "white"))))
   `(company-tooltip-selection ((t (:background "steelblue" :foreground "white"))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))
   `(company-tooltip-annotation ((t (:inherit default :background , (color-lighten-name bg 5) :foreground "medium purple"))))))

;; == ido-at-point ===================================================================

(use-package ido-at-point
  :ensure
  :config
  (ido-at-point-mode)
  )

;; == ggtags =========================================================================
(use-package ggtags
  :ensure t
  :defer t
  :init
;  (add-hook 'c-mode-common-hook '(lambda () (ggtags-mode 1)))
  (add-hook 'c++-mode-hook '(lambda () (ggtags-mode 1)))
  (add-hook 'c-mode-hook '(lambda () (ggtags-mode 1)))
  :bind ("M-/" . ggtags-find-file)
  )

;; == yasnippet =======================================================================
(use-package yasnippet
  :ensure t
  :defer t
  :init
  (yas-global-mode 1)
  )

;; == iedit ===========================================================================
(use-package iedit
  :ensure t
  :defer t
  :config
  (iedit-mode)
  )

;; == flycheck-iron ===================================================================
(use-package flycheck-irony
  :ensure t
  :init
  (eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
)  