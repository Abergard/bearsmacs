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
     ("semantic(defautlt)")
     ("anzu(default)")                ; displays current match and total matches information
     ("avy(default)")                 ; go to char
     ("srefactor(default)")           ; c++ refactoring tool
     ("neotree(default)")             ; directories tree
     ("cmake(default)")               ;
     ("whitespace(default)")          ;
     ("git-mode(default)")            ;
     ("which-key(default)")           ; display pop-up information about avaiable function for clicked keys
     ("projectile(default)")          ; manage projects
     ("vdiff(default)")               ;
     ("perspective(default)")         ; manage workplaces
     ("multiple-cursors")             ;
     ("irony-eldoc(default)")
     ("company-irony(default)")
     ("company-rtags"))nil t "")
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

(defun toggle-window-split ()
  "Toggle window split."
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))

(defun rotate-windows ()
  "Rotate your windows."
  (interactive)
  (cond ((not (> (count-windows)1))
         (message "You can't rotate a single window!"))
        (t
         (setq i 1)
         (setq numWindows (count-windows))
         (while  (< i numWindows)
           (let* (
                  (w1 (elt (window-list) i))
                  (w2 (elt (window-list) (+ (% i numWindows) 1)))

                  (b1 (window-buffer w1))
                  (b2 (window-buffer w2))

                  (s1 (window-start w1))
                  (s2 (window-start w2))
                  )
             (set-window-buffer w1  b2)
             (set-window-buffer w2 b1)
             (set-window-start w1 s2)
             (set-window-start w2 s1)
             (setq i (1+ i)))))))

(defun uniquify-all-lines-region (start end)
    "Find duplicate lines in region START to END keeping first occurrence."
    (interactive "*r")
    (save-excursion
      (let ((end (copy-marker end)))
        (while
            (progn
              (goto-char start)
              (re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
          (replace-match "\\1\n\\2")))))

  (defun uniquify-all-lines-buffer ()
    "Delete duplicate lines in buffer and keep first occurrence."
    (interactive "*")
    (uniquify-all-lines-region (point-min) (point-max)))

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
