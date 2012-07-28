; Disabling the toolbar. It serves no purpose.
(tool-bar-mode 0)

; Enabling ido-mode
(require 'ido)
(ido-everywhere 1)

; Disabling the annoying 'whatever is a <whatever>-controlled file. Follow link?'
(setq vc-follow-symlinks t)
