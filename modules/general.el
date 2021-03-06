; Disabling the toolbar. It serves no purpose.
(tool-bar-mode 0)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)

; Enabling ido-mode
(require 'ido)
(ido-everywhere 1)
(ido-mode)
;;; Enabling 'fuzzy' completion.
(setq ido-enable-flex-matching t)

; Disabling the annoying 'whatever is a <whatever>-controlled file. Follow link?'
(setq vc-follow-symlinks t)

;; Enter will autoindent
(define-key global-map (kbd "RET") 'newline-and-indent)

;;; Enabling the server
(server-start)

;;; Highlighting the current line
(global-hl-line-mode 1)

;;; Auto-reverting files whenever they are changed on disk
(global-auto-revert-mode 1)

;;; Showing line numbers. This requires ELPA (which is now built-in)
(dotemacs-maybe-require 'nlinum
			(global-linum-mode 1))

(global-set-key [(tab)] 'smart-tab)
(defun smart-tab ()
  "This smart tab is minibuffer compliant: it acts as usual in
    the minibuffer. Else, if mark is active, indents region. Else if
    point is at the end of a symbol, expands it. Else indents the
    current line."
  (interactive)
  (if (minibufferp)
      (unless (minibuffer-complete)
        (dabbrev-expand nil))
    (if mark-active
        (indent-region (region-beginning)
                       (region-end))
      (if (looking-at "\\_>")
          (complete-symbol nil)
        (indent-for-tab-command)))))

(global-set-key (kbd "<f5>") 'compile)

;; Spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; Paren matching
(show-paren-mode t)

;; Making Emacs scroll a buffer one line at a time, instead of half-screen
(setq scroll-step 1)
(setq scroll-conservatively 5)

(column-number-mode t)

(setq cursor-type 'bar)
(setq cursor-in-non-selected-windows 'hollow)

(set-default cursor-type 'bar)
(setq cursor-type 'bar)

(let* ((window (minibuffer-window))
       (buffer (window-buffer window)))
  (with-current-buffer buffer
    (setq cursor-type 'box)))


(add-hook 'after-save-hook 'delete-trailing-whitespace)

;; disable bell function
(setq ring-bell-function 'ignore)
