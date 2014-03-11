; Loading the awesome module system
(defvar dotemacs-base-module-dir "./modules/")

(let* ((dotemacs-filename (or load-file-name buffer-file-name))
       (symlink (file-symlink-p dotemacs-filename))
       (dotemacs-directory (file-name-directory (or symlink dotemacs-filename))))
  (load
   (concat dotemacs-directory dotemacs-base-module-dir "dotemacs.el")))

(dotemacs-setup)

(dotemacs-load-modules '("general"
			 "theme"
			 "lisp"
			 "c"
			 "magit"
			 "power-line"
                         "nyan"
			 "textmate"
			 "coffee"
			 "ruby"
			 "osx"
			 "lua"
			 "markdown"
			 "semantic"
                         "haskell"
			 "yasnippet"))
