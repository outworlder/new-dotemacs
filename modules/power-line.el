;;; Powerline from: https://github.com/jonathanchu/emacs-powerline

(add-hook 'after-init-hook
	  (lambda ()
	    (require 'powerline)
	    (setq powerline-color1 "#657b83")
	    (setq powerline-color2 "#839496")

	    (set-face-attribute 'mode-line nil
				:foreground "#fdf6e3"
				:background "#859900"
				:box nil)
	    (set-face-attribute 'mode-line-inactive nil
				:box nil)))


