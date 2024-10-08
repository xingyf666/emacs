;;; perspeen-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "perspeen" "perspeen.el" (0 0 0 0))
;;; Generated autoloads from perspeen.el

(defvar perspeen-mode nil "\
Non-nil if Perspeen mode is enabled.
See the `perspeen-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `perspeen-mode'.")

(custom-autoload 'perspeen-mode "perspeen" nil)

(autoload 'perspeen-mode "perspeen" "\
Toggle Perspeen mode on or off.

This is a minor mode.  If called interactively, toggle the
`Perspeen mode' mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='perspeen-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "perspeen" '("perspeen-"))

;;;***

;;;### (autoloads nil "perspeen-tab" "perspeen-tab.el" (0 0 0 0))
;;; Generated autoloads from perspeen-tab.el

(autoload 'perspeen-tab-start "perspeen-tab" "\
Start perspeen-tab." t nil)

(register-definition-prefixes "perspeen-tab" '("perspeen-tab-"))

;;;***

;;;### (autoloads nil nil ("perspeen-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; perspeen-autoloads.el ends here
