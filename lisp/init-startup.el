;; utf-8
(prefer-coding-system 'utf-8)
(unless *is-windows*
  (set-selection-coding-system 'utf-8))

;; garbage collection
(setq gc-cons-threshold most-positive-fixnum)

;; disable bak
(setq make-backup-files nil)

;; disbale autosave
(setq auto-save-default nil)

;; auto refresh content
(global-auto-revert-mode t)

;; replace selection
(delete-selection-mode t)

;; provide mod name
(provide 'init-startup)
