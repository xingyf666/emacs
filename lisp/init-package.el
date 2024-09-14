;; benchmark
(use-package benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init . benchmark-init/deactivate))

;; save command history
(use-package savehist
  :ensure nil
  :hook (after-init . savehist-mode)
  :init (setq enable-recursive-minibuffers t
              history-length 1000
              savehist-additional-variables '(mark-ring
                                              global-mark-ring
                                              search-ring
                                              regexp-search-ring
                                              extended-command-history)
              savehist-autosave-interval 300)
  )
  
;; save last edit position
(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

;; smart key
(use-package crux
  :bind (("C-k" . crux-smart-kill-line)
	 ;; ("C-t" . crux-top-join-line)
	 ("C-x ," . crux-find-user-init-file)
	 ("C-a" . crux-move-beginning-of-line)))

(use-package mwim
  :bind ("M-a" . mwim-end-of-code-or-line))

;; delete
;; (use-package hungry-delete
;;   :bind ("C-c DEL" . hungry-delete-backward)
;;   :bind ("C-c d" . hungry-delete-forward))

;; move code
(use-package drag-stuff
  :bind (("M-[" . drag-stuff-up)
	 ("M-]" . drag-stuff-down)))

;; enforce search: not compatiable with consult-ripgrep
;; (use-package ivy
;;   :defer 1
;;   :demand
;;   :hook (after-init . ivy-mode)
;;   :config
;;   (ivy-mode 1)
;;   (setq ivy-use-virtual-buffers t
;; 	ivy-initial-inputs-alist nil
;; 	ivy-count-format "%d/%d "
;; 	enable-recursive-minibuffers t
;; 	ivy-re-builders-alist '((t . ivy--regex-ignore-order))))

(use-package counsel
  :after (ivy)
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ("C-x f" . counsel-recentf)
	 ("C-x g" . counsel-git)))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper))
  :config (setq swiper-action-recenter t
		swiper-include-line-number-in-search t))

;; (use-package avy
;;   :bind (("M-g c" . 'avy-goto-char)
;; 	 ("M-g l" . 'avy-goto-line)
;; 	 ("M-g w" . 'avy-goto-word-1)))

;; find defination and do something
(use-package embark
  :ensure t
  :bind ("C-;" . 'embark-act))

;; find current
(use-package consult
  :ensure t
  :bind
  (("M-l" . 'consult-imenu)
   ("C-r" . consult-ripgrep-current-file-dir))
  :config
  (defun consult-ripgrep-current-file-dir ()
    "Run consult-ripgrep in the current file's directory."
    (interactive)
    (let ((current-dir (if (buffer-file-name)
                           (file-name-directory (buffer-file-name))
                         default-directory)))
      (let ((default-directory current-dir))
        (consult-ripgrep)))))

(use-package embark-consult
  :ensure t 
  :after (embark consult)
  :hook (embark-collect-mode . consult-preview-at-point-mode))

;; ensure custom-file exists and then load file
(when (file-exists-p custom-file)
  (load-file custom-file))

;; multiple-cursors
;; (use-package multiple-cursors
;;   :bind ("M-m" . mc/edit-lines))

;; command history
(use-package amx
  :init (amx-mode))

;; command comments
(use-package marginalia
  :init (marginalia-mode)
  :bind (:map minibuffer-local-map ("M-a" . marginalia-cycle)))

;; auto-complete
(use-package company
  :hook (after-init . global-company-mode)
  :config (setq company-minimum-prefix-length 1
		company-show-quick-access t))

;; show options document
(use-package company-box
  :hook (company-mode . company-box-mode))

;; auto complete () pairs
(use-package smartparens
  :hook ('prog-mode . 'smartparens-global-mode))

;; wonderful terminal
(use-package vterm
  :bind ("M-s" . 'vterm))

;; hideshow
(use-package hideshow
  :diminish hs-minor-mode
  :bind ("C-x TAB" . hs-toggle-hiding)
  :hook ('prog-mode . hs-minor-mode))

;; language check, can be done by eglot
;; (use-package flymake
;;   :hook (prog-mode . flymake-mode)
;;   :config
;;   (global-set-key (kbd "M-n") #'flymake-goto-next-error)
;;   (global-set-key (kbd "M-p") #'flymake-goto-prev-error))

;; key tips
(use-package which-key
  :defer nil
  :config (which-key-mode))

;; buffer position
(use-package ivy-posframe
  :custom-face (ivy-posframe-border
		((t (:background "white"))))
  :init (setq ivy-posframe-display-functions-alist
	      '((swiper . ivy-posframe-display-at-frame-center)
		(complete-symbol . ivy-posframe-display-at-point)
		(counsel-M-x . ivy-posframe-display-at-frame-center)
		(counsel-find-file . ivy-posframe-display-at-frame-center)
		(ivy-switch-buffer . ivy-posframe-display-at-frame-center)
		(t . ivy-posframe-display-at-frame-center))
	      ivy-posframe-parameters
	      '((left-fringe . 20)
		(right-fringe . 20))
	      )
  (ivy-posframe-mode 1)
  )
(setq ivy-posframe-border-width 2)

;; switch window
(use-package ace-window
  :bind (("M-o" . 'ace-window)))

;; projects
(use-package projectile
  :bind (("C-x p" . projectile-command-map))
  :config
  (setq projectile-mode-line "Projectile")
  (setq projectile-track-known-projects-automatically nil))

(use-package counsel-projectile
  :after (projectile)
  :init (counsel-projectile-mode))

;; code hilight
;; (use-package treesit-auto
;;   :demand t
;;   :config
;;   (setq treesit-auto-install 'prompt)
;;   (setq treesit-font-lock-level 4)
;;   (global-treesit-auto-mode))

;; snippets
(use-package yasnippet
  :ensure t
  :hook ((prog-mode . yas-minor-mode)
         (org-mode . yas-minor-mode))
  :init
  :config
  (progn
    (setq hippie-expand-try-functions-list
          '(yas/hippie-try-expand
            try-complete-file-name-partially
            try-expand-all-abbrevs
            try-expand-dabbrev
            try-expand-dabbrev-all-buffers
            try-expand-dabbrev-from-kill
            try-complete-lisp-symbol-partially
            try-complete-lisp-symbol))))

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)

;; code mode
(use-package eglot
  :hook ((c-mode
	  c++-mode
	  python-mode
	  rust-mode
	  typescript-mode
	  js-mode
	  html-mode
	  css-mode
	  web-mode) . eglot-ensure)
  ;; :bind (("C-c e f" . #'eglot-format)                       ;; format
  ;; 	 ("C-c e a" . #'eglot-code-actions)                 ;; show code actions
  ;; 	 ("C-c e i" . #'eglot-code-action-organize-imports) ;; import actions
  ;; 	 ("C-c e q" . #'eglot-code-action-quickfix))        ;; quick fix
  :config
  (add-to-list 'eglot-server-programs '((js-mode js-ts-mode typescript-mode) . ("/usr/local/bin/typescript-language-server" "--stdio")))
  (add-to-list 'eglot-server-programs '((html-mode web-mode) . ("/usr/local/bin/vscode-html-language-server" "--stdio")))
  (add-to-list 'eglot-server-programs '((css-mode) . ("/usr/local/bin/vscode-css-language-server" "--stdio")))
  ;; auto format before save
  (defun eglot-actions-before-save()
    (add-hook 'before-save-hook
	      (lambda()
		(call-interactively #'eglot-format)
		(call-interactively #'eglot-code-action-organize-imports))))
  (add-hook 'eglot--managed-mode-hook #'eglot-actions-before-save))

;; quick run code
(use-package quickrun
  :commands (quickrun)
  :init
  (quickrun-add-command "c++/c1z"
    '((:command . "clang++")
      (:exec . ("%c -std=c++1z %o -o %e %s"
                "%e %a"))
      (:remove . ("%e"))
      (:description . "Compile and run C++ file with clang++"))
    :default "c++")
  (quickrun-add-command "python"
    '((:command . "python3")
      (:exec . ("%c %s"))
      (:description . "Run Python script with python3"))
    :default "python")
  (quickrun-add-command "rust"
    '((:command . "rustc")
      (:exec . ("%c -o %e %s" "%e"))
      (:remove . ("%e"))
      (:description . "Compile and run Rust code"))
    :default "rust"))

(global-set-key (kbd "<f5>") 'quickrun)

;; git
;; (use-package magit)

;; noetree
(use-package neotree
  :bind (("C-t" . neotree-toggle))
  :config
  ;; theme
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  ;; open root dir
  (setq neo-smart-open t)

  ;; auto fresh
  (setq neo-autorefresh t)
  (setq neo-window-width 30))

;; undo tree: enabled by C-x u
(use-package undo-tree
  :hook (after-init . global-undo-tree-mode)
  :init
  (setq undo-tree-visualizer-timestamps	t
	undo-tree-enable-undo-in-region nil
	undo-tree-auto-history nil
	undo-tree-auto-save-history nil
	undo-tree-history-directory-alist `(("." . "~/.emacs.d/.cache/")))
  ;; keep the diff window
  (with-no-warnings
    (make-variable-buffer-local 'undo-tree-visualizer-diff)
    (setq-default undo-tree-visualizer-diff t)))

;; enable org template
(require 'org-tempo)

;; smooth scroll
;; (use-package good-scroll
;;   :init (good-scroll-mode))

;; use restart-emacs
(use-package restart-emacs)

;; provide mod name
(provide 'init-package)
