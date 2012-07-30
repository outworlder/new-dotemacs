; Loading the awesome module system
; TODO: Also, this stinks. Figure out a way to deal with these directories.
;;; AFAIK, there is no way to get the current directory. We could always place dotemacs on .emacs.d
(load-library "/Users/stephen/Documents/Projects/Guilda/new-dotemacs/modules/dotemacs.el")
(dotemacs-setup "~/Documents/Projects/Guilda/new-dotemacs/")

(dotemacs-load-children '("general"
			  "theme"
			  "lisp"
			  "c"
			  "magit"
			  "power-line"
			  "textmate"))

