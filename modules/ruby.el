;(require 'inf-ruby)
(require 'ruby-mode)
(require 'rvm)

(dotemacs-maybe-require 'slim-mode)

(defun ruby-insert-end ()
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))

;; TODO: Only check this for .rb files.
;; Warns if we are saving a file with a debugger statement
(defun check-ruby-debugger-statement ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (if (word-search-forward "debugger" nil t nil)
        (message "Warning: There's a debugger statement in the code."))))

;; Invoke ruby with '-c' to get syntax checking
;; (defun flymake-ruby-init ()
;;   (let* ((temp-file   (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;; 	 (local-file  (file-relative-name
;;                        temp-file
;;                        (file-name-directory buffer-file-name))))
;;     (list "ruby" (list "-c" local-file))))

;(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
;(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)

;(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)

(defun ruby-insert-hash-string ()
  "Inserts a #{} but only if inside a string"
  (interactive)
  (let ((stringp (fourth (syntax-ppss)))
	(skeleton-end-newline nil))
    (if stringp
	(skeleton-insert '(nil ?# ?{ _ ?} nil))
      (skeleton-insert '(nil ?# _)))))

(defun ruby-insert-=> ()
  "Inserts a =>"
  (interactive)
  (let ((skeleton-end-newline nil))
    (skeleton-insert '(nil " => "))))

(require 'rvm)
(rvm-use-default)

(add-hook 'ruby-mode-hook
          (lambda ()
	    (require 'ruby-electric)
	    (ruby-electric-mode t)
	    (rvm-activate-corresponding-ruby)
	    (define-key ruby-mode-map "\C-m" 'newline-and-indent)
	    (inf-ruby-keys)
	    (local-set-key "#" 'ruby-insert-hash-string)
	    (local-set-key [f1] 'ri)
	    (local-set-key "\M-\C-i" 'ri-ruby-complete-symbol)
	    (local-set-key [f4] 'ri-ruby-show-args)
	    (local-set-key (read-kbd-macro  "C-'") 'ruby-insert-=>)
	    ;; Don't want flymake mode for ruby regions in rhtml files and also on read only files
	    (if (and (not (null buffer-file-name)) (file-writable-p buffer-file-name))
		(flymake-mode t))) t)


(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(eval-after-load "ruby-mode" '(inf-ruby-keys))

(add-hook 'after-save-hook 'check-ruby-debugger-statement)
(add-hook 'ruby-mode-hook 'check-ruby-debugger-statement)
