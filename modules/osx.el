
(when (equal system-type 'darwin)
;;;  read in PATH from .bashrc
  (if (not (getenv "TERM_PROGRAM"))
      (let ((path (shell-command-to-string
		   "$SHELL -cl \"printf %s \\\"\\\$PATH\\\"\"")))
        (setenv "PATH" path)
        (setq exec-path (split-string path ":"))))
  (setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:" (getenv "PATH")))
  (push "/opt/local/bin" exec-path)
  (push "/usr/local/bin" exec-path)
  (push "/usr/bin" exec-path)
  (push "/usr/local/Cellar/chicken/4.8.0/bin" exec-path)
  (setq st-smaller-font "Calibri-14")
  (setq st-default-font "Source Code Pro-14")

  (set-default-font st-default-font)
  ;; ;; Setting font for new frames
  (add-to-list 'default-frame-alist `(font . ,st-default-font))

  ;; ;; Using a smaller font for the modeline
  (set-face-font 'mode-line st-smaller-font)
  (set-face-font 'mode-line-inactive st-smaller-font)
  ;;(set-face-font 'modeline-mousable "-unknown-DejaVu Sans-bold-normal-normal-*-14-*-*-*-*-0-iso10646-1")
  (set-face-font 'minibuffer-prompt st-smaller-font))
