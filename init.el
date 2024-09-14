;;; init.el --- Load the full configuration
;;; Commentary:

;; This file bootstraps the configurations, which is divided into
;; a number of other files

;;; code:
(add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "lisp")))  ;; ~/emacs.d

;; save custom config to custom.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; autoremove unused pacakges after init
(add-hook 'after-init-hook 'package-autoremove)

;; load config
(require 'init-const)
(require 'init-kbd)
(require 'init-startup)
(require 'init-elpa)
(require 'init-ui)
(require 'init-third)
(require 'init-package)
(require 'init-evil)


;;; init.el ends here
