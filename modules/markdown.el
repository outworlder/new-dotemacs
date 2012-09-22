(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist (append auto-mode-alist
			      '(("\\.text" . markdown-mode)
				("\\.md" . markdown-mode))))
