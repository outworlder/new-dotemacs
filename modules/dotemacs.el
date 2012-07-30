(require 'cl)

(defun dotemacs-setup (directory)
					; Setting up the load paths
  (setq dotemacs-base directory)
  (add-to-list 'load-path (concat directory "support"))
  (add-to-list 'load-path (concat directory "modules"))
  (add-to-list 'custom-theme-load-path (concat directory "themes"))
  ;; Telling Emacs to keep stinky customizations out of our beautiful .emacs!
  (setq custom-file (concat directory "modules/custom.el"))
  (load-file custom-file))

(defmacro dotemacs-maybe-require (package &rest body)
  "Tries to load the specified package. If it succeeds, then body is executed (if provided)."
  (if body
      `(progn
	 (require ,package nil t)
	 (if (featurep ,package)
	     (progn
	       ,@body)))
    `(require ,package nil t)))

(dotemacs-maybe-require 'todochiku)
(dotemacs-maybe-require 'auto-install
    (setq auto-install-directory "~/.emacs.children/support/auto-install/"))
	       
(defun dotemacs-display-status (status)
  (if status
    (propertize "OK" 'face "flymake-warnline")
    (propertize "ERROR" 'face "flymake-errline")))

(setq dotemacs-loaded-ok t)

(defun dotemacs-todochiku-notify ()
  (if (not (null dotemacs-loaded-ok))
    (todochiku-message "Dotemacs status" "All packages loaded successfully." (todochiku-icon 'package))
    (todochiku-message "Dotemacs status" "Error loading some packages. Check the *Dotemacs status* buffer for more info." (todochiku-icon 'alert))))

(defun dotemacs-load-children (dotemacs-children-list)
  (with-current-buffer (get-buffer-create "*Dotemacs Status*")
    (setq buffer-read-only nil)
    (insert "Dotemacs package load status: \n\n")
    (mapc (lambda(x)
	    (condition-case err-message
		(unwind-protect
		    (load-library x)
		  (insert (format "[%s] Finished loading file: %s\n" (dotemacs-display-status t) x)))
	      (error (progn
		      (insert (format "[%s] Unable to load file: %s - %s\n" (dotemacs-display-status nil) x err-message))
		      (setq dotemacs-loaded-ok nil))))) dotemacs-children-list)
    (setq buffer-read-only t))
  (if (featurep 'todochiku)
      (add-hook 'after-init-hook 'dotemacs-todochiku-notify)))

(defun dotemacs-add-support (directory)
    (add-to-list 'load-path (concat dotemacs-base "support/" directory)))

(defun dotemacs-recompile ()
  (interactive)
  (byte-recompile-directory dotemacs-base 0 nil))

;;; TODO: We are autocompiling Emacs. Let's autocompile everything!
(defun dotemacs-autocompile nil
  "compile itself if ~/.emacs"
  (interactive)
  (require 'bytecomp)
  (let ((dotemacs (expand-file-name "~/.emacs")))
    (if (string= (buffer-file-name) (file-chase-links dotemacs))
	(progn
	  (byte-compile-file dotemacs)
	  (dotemacs-recompile)))
    (if (string-prefix-p (expand-file-name dotemacs-base) (buffer-file-name))
	(dotemacs-recompile))))

(add-hook 'after-save-hook 'dotemacs-autocompile)

(provide 'dotemacs)
