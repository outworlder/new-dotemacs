(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode)))
(add-hook 'scheme-mode-hook           (lambda () (paredit-mode)))

(dotemacs-maybe-require 'highlight-parentheses
			(highlight-parentheses-mode))
