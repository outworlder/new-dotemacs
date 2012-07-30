; Disabling the toolbar. It serves no purpose.
(tool-bar-mode 0)

; Enabling ido-mode
(require 'ido)
(ido-everywhere 1)
(ido-mode)
;;; Enabling 'fuzzy' completion.
(setq ido-enable-flex-matching t)

; Disabling the annoying 'whatever is a <whatever>-controlled file. Follow link?'
(setq vc-follow-symlinks t)

;; Enter will autoindent
(define-key global-map (kbd "RET") 'newline-and-indent)

;;; Enabling the server
(server-start)
