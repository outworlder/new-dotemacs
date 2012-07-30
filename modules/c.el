(require 'cc-mode)
(require 'cc-styles)

;;; Automatic newline after {, } and ;
(setq c-auto-newline t)


;;-----------------------------------------------------------------------------
;; Setting the C style
;;-----------------------------------------------------------------------------

(add-hook 'c-mode-hook
          (lambda ()
            (c-set-style "stroustrup")
            (setq c-basic-offset 4)
            (c-toggle-auto-newline t)
            (turn-on-auto-fill)
            (c-toggle-hungry-state t)))

;; Setting the C++ style
(add-hook 'c++-mode-hook
          (lambda ()
            (c-set-style "stroustrup")
            (setq c-basic-offset 4)
            (c-toggle-auto-newline t)
            (turn-on-auto-fill)
            (c-toggle-hungry-state t)))

;;; Toggling between source and header files
(add-hook 'c-mode-common-hook
	   (lambda() 
	     (local-set-key  (kbd "C-c o") 'ff-find-other-file)))
