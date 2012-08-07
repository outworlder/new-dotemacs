;; cedet
(require 'semantic)
(require 'semantic/sb)
(require 'srecode)

;;; TODO: Figure out what's all this stuff.

(global-ede-mode 1)
(semantic-mode 1)
(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-idle-completions-mode 1)
(global-semantic-decoration-mode 1)
(global-semantic-highlight-func-mode 1)
(global-semantic-stickyfunc-mode -1)
(global-semantic-idle-summary-mode 1)
(global-semantic-mru-bookmark-mode 1)

;;; Checking if GNU Global can be found.
(condition-case err-message
    (progn
      (call-process "global")
      (semanticdb-enable-gnu-global-databases 'c-mode)
      (semanticdb-enable-gnu-global-databases 'c++-mode))
  (file-error (message "GNU global was not found.")))

(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)
(set-default 'semantic-case-fold t)


(setq qt4-base-dir (file-name-as-directory  "/usr/local/Cellar/qt/4.8.2/include"))
(semantic-add-system-include qt4-base-dir 'c++-mode)
(add-to-list 'auto-mode-alist (cons qt4-base-dir 'c++-mode))
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "QtCore/qconfig.h"))
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "QtCore/qconfig-dist.h"))
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "QtCore/qglobal.h"))

