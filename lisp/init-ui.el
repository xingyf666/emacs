;; install theme
;; (use-package gruvbox-theme
;;   :init (load-theme 'gruvbox-dark-soft t))

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold nil
	doom-themes-enable-italic t)
  :init (load-theme 'doom-monokai-octagon t))

(use-package simple
  :ensure nil
  :hook (after-init . size-indication-mode)
  :init
  (progn
    (setq column-number-mode t)
    ))

;; model line
(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode t))

;; all icons
(use-package all-the-icons
  :demand t
  :if (display-graphic-p))
;; (all-the-icons-install-fonts)

;; install smart-mode-line
;; (use-package smart-mode-line
;;   :init
;;   (setq sml/no-confirm-load-theme t
;; 	sml/theme 'respectful)
;;   (sml/setup))

;; dashboard
(use-package dashboard
  :after (all-the-icons)
  ;; avoid delay load
  :hook (after-init . dashboard-setup-startup-hook)
  :init
  (setq dashboard-icon-type 'all-the-icons)
  (setq dashboard-heading-shorcut-format " [%s]")
  (setq dashboard-set-heading-icons '((recents . "history")
				      (projects . "rocket")))
  (setq dashboard-startup-banner "~/.emacs.d/emacs.png")
  (setq dashboard-banner-logo-title "Welcome to Emacs!")
  (setq dashboard-navigation-cycle t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-center-content t)
  (setq dashboard-set-navigator t)
  (setq dashboard-items '((recents . 5)
			  (projects . 10))))

;; show line num
(setq display-line-numbers-type 't)
(global-display-line-numbers-mode t)

;; set font-size
(set-face-attribute 'default nil :height 140)

;; smooth scroll
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
;; (setq mouse-wheel-progressive-speed nil)

;; close welcome 
(setq inhibit-startup-screen t)

;; set frame size
;; width: characters
;; height: lines
(setq initial-frame-alist
      '((width . 150)
	(height . 50)))

;; use thin cursor
(setq-default cursor-type '(bar . 5))

;; hilight line
(global-hl-line-mode 1)

;; hilight current line
(set-face-attribute 'hl-line t
		    :underline nil
		    :background "#3A3D4B"
		    :inherit nil)

;; hilight selected
(set-face-attribute 'region nil
		    :background "#646464")

;; hidden bar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; provide mod name
(provide 'init-ui)
