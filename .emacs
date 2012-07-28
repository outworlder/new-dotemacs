
; Setting up the load paths

; TODO: This stinks. Figure out a way to detect where .emacs is located.
(setq dotemacs-base "~/Documents/Projects/Guilda/new-dotemacs/")

(add-to-list 'load-path (concat dotemacs-base "modules") t)
(add-to-list 'load-path (concat dotemacs-base "support") t)

(load-library "dotemacs")

(dotemacs-load-children '("general"))
