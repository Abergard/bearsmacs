;;; bears-function.el --- local styles
;;; Commentary:

;;; Code:

(require 'cl-lib)
(require 'bears-style)

(defun bears-get-packages-names(packages-dir)
  "Function return all packages names located in packages directory"
  (let ((bears-packages-names nil))
    (let ((bears-packages-files
           (directory-files
            (concat "~/.emacs.d/private/" packages-dir)
            nil "^\\([^.]\\|\\.[^.]\\|\\.\\..\\)" 'nosort)))
      (while bears-packages-files
        (push (intern (substring (pop bears-packages-files) 6 -3))
              bears-packages-names)))
    bears-packages-names)
  )

(defun bears-mark-default-packages(packages)
  "Function mark default packages with tag (default)"
    (let ((packages (cl-set-difference packages bears-default-packages)))
      (let ((bears-default-tmp bears-default-packages))
        (while bears-default-tmp
          (push (concat (symbol-name (pop bears-default-tmp)) " [default]")
                packages)))
      packages)
    )

(defun bears-get-package-name(name-with-additional-info)
  "Function remove '[default]' mark from string."
  (car (split-string name-with-additional-info)))

(defun bears-packages-list ()
  "Function display all available packages."
  (interactive)
  (insert-before-markers
   (bears-get-package-name (completing-read "Available packages: "
                   (bears-mark-default-packages
                    (bears-get-packages-names "packages"))))
   )
  )

(defun bears-theme-list ()
  "Function display all available themes."
  (interactive)
  (insert-before-markers
   (completing-read "Available themes: "
                    (bears-get-packages-names "themes"))
   )
  )

(defun bears-configuration-list ()
  "Dispplay all available configurations."
  (interactive)
  (insert-before-markers
   (completing-read
    "Available configurations: "
    '(("bears-common-configuration")
      ("bears-prog-configuration")
      ("bears-c-configuration")
      ("bears-c++-configuration")
      ("bears-python-configuration")
      ("bears-ttcn3-configuration"))nil t "")
   )
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

(defun bears-load-theme-args (gui-theme terminal-theme)
  "Load GUI-THEME and TERMINAL-THEME."
  (if (display-graphic-p)
      (bears-load-theme-arg gui-theme)
    (bears-load-theme-arg terminal-theme)))

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

(defun bears-get-current-dir ()
  "Put the current file name on the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
      (message filename))))

(defun sort-lines-by-length (reverse beg end)
  "Sort lines by length."
  (interactive "P\nr")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (let ;; To make `end-of-line' and etc. to ignore fields.
          ((inhibit-field-text-motion t))
        (sort-subr reverse 'forward-line 'end-of-line nil nil
                   (lambda (l1 l2)
                     (apply #'< (mapcar (lambda (range) (- (cdr range) (car range)))
                                        (list l1 l2)))))))))

(defun move-text-internal (arg)
   (cond
    ((and mark-active transient-mark-mode)
     (if (> (point) (mark))
            (exchange-point-and-mark))
     (let ((column (current-column))
              (text (delete-and-extract-region (point) (mark))))
       (forward-line arg)
       (move-to-column column t)
       (set-mark (point))
       (insert text)
       (exchange-point-and-mark)
       (setq deactivate-mark nil)))
    (t
     (beginning-of-line)
     (when (or (> arg 0) (not (bobp)))
       (forward-line)
       (when (or (< arg 0) (not (eobp)))
            (transpose-lines arg))
       (forward-line -1)))))

(defun move-text-down (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines down."
   (interactive "*p")
   (move-text-internal arg))

(defun move-text-up (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines up."
   (interactive "*p")
   (move-text-internal (- arg)))

(defun decode-hex-string (hex-string)
  "Decode HEX-STRING in hex to human readable format."
  (apply #'concat
     (loop for i from 0 to (- (/ (length hex-string) 2) 1)
           for hex-byte = (substring hex-string (* 2 i) (* 2 (+ i 1)))
           collect (format "%c" (string-to-number hex-byte 16)))))

(defun bears-eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(defun remove-from-buffer (regex)
  "Remove lines from buffer which match REGEX."
  (interactive "sRemove: ")
  (let (tmp-read-only buffer-read-only)
    (read-only-mode -1)
    (flush-lines regex)
    (read-only-mode tmp-read-only))
  )

(defun remove-ut-grep ()
  "Remove lines from UT directory for grep results."
  (interactive)
  (remove-from-buffer "UT")
  )

(defun remove-ut-grep-and-self (self)
  "Remove lines from UT (SELF) directory for grep results."
  (interactive "sWrite search item: ")
  (remove-ut-grep)
  (remove-from-buffer self)
  )

 (defun toggle-transparency ()
   (interactive)
   (let ((alpha (frame-parameter nil 'alpha)))
     (set-frame-parameter
      nil 'alpha
      (if (eql (cond ((numberp alpha) alpha)
                     ((numberp (cdr alpha)) (cdr alpha))
                     ;; Also handle undocumented (<active> <inactive>) form.
                     ((numberp (cadr alpha)) (cadr alpha)))
               100)
          '(85 . 50) '(100 . 100)))))

(provide 'bears-functions)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; bears-functions.el ends here
