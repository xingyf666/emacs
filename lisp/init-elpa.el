;; config source
(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

;; don't check signature
(setq package-check-signature nil)

;; use package
(require 'package)

;; initialize package
(unless (bound-and-true-p package--initialized)
  (package-initialize))

;; refresh package source
(unless package-archive-contents
  (package-refresh-contents))

;; unless use-package is installed, else refresh package source an install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; config use-package
(setq use-package-always-ensure t ;; always ensure package is installed
      use-package-always-defer t  ;; always delay (load on when used)
      use-package-expand-minimally t
      use-package-enable-imenu-support t)

;; enable use-package
(require 'use-package)

;; provide mod name
(provide 'init-elpa)
