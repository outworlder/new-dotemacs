(add-to-list 'custom-theme-load-path (concat dotemacs-base "themes/emacs-color-theme-solarized"))

(load-theme 'solarized-light)

(setq st-smaller-font "Calibri-14")
(setq st-default-font "Inconsolata-16")

(set-default-font st-default-font)
;; ;; Setting font for new frames
(add-to-list 'default-frame-alist `(font . ,st-default-font))

;; ;; Using a smaller font for the modeline
(set-face-font 'mode-line st-smaller-font)
(set-face-font 'mode-line-inactive st-smaller-font)
;;(set-face-font 'modeline-mousable "-unknown-DejaVu Sans-bold-normal-normal-*-14-*-*-*-*-0-iso10646-1")
(set-face-font 'minibuffer-prompt st-smaller-font)

