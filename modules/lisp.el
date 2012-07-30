
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
