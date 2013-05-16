;;; Lisp-like languages customizations
(dotemacs-add-support "auto-complete-1.3.1")
(dotemacs-add-support "slime-2012-07-31")

(dotemacs-maybe-require 'chicken-scheme)

(defun dotemacs-lisp-stuff ()
  (interactive)
  (dotemacs-maybe-require 'paredit
		 (paredit-mode))
  (dotemacs-maybe-require 'highlight-parentheses
			  (highlight-parentheses-mode)))

(add-hook 'emacs-lisp-mode-hook       'dotemacs-lisp-stuff)
(add-hook 'lisp-mode-hook             'dotemacs-lisp-stuff)
(add-hook 'lisp-interaction-mode-hook 'dotemacs-lisp-stuff)
(add-hook 'scheme-mode-hook           'dotemacs-lisp-stuff)


;;; Slime!

(dotemacs-maybe-require 'slime
	       (require 'slime)
	       (require 'slime-autoloads)
	       (slime-setup '(slime-fancy slime-banner))
	       (autoload 'chicken-slime "chicken-slime" "Swank backend for Chicken" t))

;;; TODO: Check if this is necessary
(add-hook 'scheme-mode-hook
	  (lambda ()
	    (setq slime-csi-path "/usr/local/bin/csi")
	    (slime-mode t)))
