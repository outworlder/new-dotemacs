; Loading the awesome module system
; TODO: Also, this stinks. Figure out a way to deal with these directories.
(load-library "/Users/stephen/Documents/Projects/Guilda/new-dotemacs/modules/dotemacs.el")
(dotemacs-setup "~/Documents/Projects/Guilda/new-dotemacs/")

(dotemacs-load-children '("general"
			  "lisp"
			  "theme"))
