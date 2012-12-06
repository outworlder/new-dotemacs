;;; Lisp-like languages customizations

(defun lisp-stuff ()
  (paredit-mode)
  (dotemacs-maybe-require 'highlight-parentheses
			  (highlight-parentheses-mode)))

(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       (lambda () (lisp-stuff)))
(add-hook 'lisp-mode-hook             (lambda () (lisp-stuff)))
(add-hook 'lisp-interaction-mode-hook (lambda () (lisp-stuff)))
(add-hook 'scheme-mode-hook           (lambda () (lisp-stuff)))

;;; Slime!

;; (dotemacs-add-support "slime-2012-07-31")

;; (require 'slime)
;; (require 'slime-autoloads)
;; (slime-setup '(slime-fancy slime-banner))

;;; Scheme customizations

(dotemacs-add-support "auto-complete-1.3.1")

(require 'chicken-scheme)

;(autoload 'chicken-slime "chicken-slime" "Swank backend for Chicken" t)

;;; TODO: Check if this is necessary

(add-hook 'scheme-mode-hook
	  (lambda ()
	    (setq slime-csi-path "/usr/local/bin/csi")
	    (slime-mode t)))
