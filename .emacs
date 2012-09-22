; Loading the awesome module system
;;; TODO: load is not working here, load-file is. Figure out why.
(load-file "/Users/stephen/Documents/Projects/Guilda/new-dotemacs/modules/dotemacs.el")
(dotemacs-setup)

(dotemacs-load-modules '("general"
			 "theme"
			 "lisp"
			 "c"
			 "magit"
			 "power-line"
			 "textmate"
			 "coffee"
			 "ruby"
			 "osx"
			 "lua"
			 "markdown"
			 "semantic"))
