;; shorten tips
(defalias 'yes-or-no-p 'y-or-n-p)

;; auto complete
;; (electric-pair-mode t)
;; (setq electric-pair-pairs
;;       '((?\" . ?\")
;; 	(?\{ . ?\})
;; 	(?\[ . ?\])))

;; ret and tab
;; (global-set-key (kbd "RET") 'newline-and-indent)
(define-key key-translation-map (kbd "RET") (kbd "ESC RET"))

;; find
;; (global-set-key (kbd "C-h C-f") 'find-function)
;; (global-set-key (kbd "C-h C-v") 'find-variable)
;; (global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; ref and def
(global-set-key (kbd "C-h C-r") 'xref-find-references)
(global-set-key (kbd "C-h C-d") 'xref-find-definitions)
(global-set-key (kbd "C-h C-b") 'xref-go-back)

;; jump between .h and .cpp
(global-set-key (kbd "C-h C-j") 'ff-find-related-file)

;; inline C-w M-w
(defadvice kill-ring-save (before slickcopy activate compile)  
  (interactive  
   (if mark-active (list (region-beginning) (region-end))  
     (list (line-beginning-position)  
	   (line-beginning-position 2)))))

(defadvice kill-region (before slickcut activate compile)  
  (interactive  
   (if mark-active (list (region-beginning) (region-end))  
     (list (line-beginning-position)  
	   (line-beginning-position 2)))))

;; copy and paste
(global-set-key (kbd "C-w") 'kill-ring-save)
(global-set-key (kbd "M-w") 'kill-region)
(global-set-key (kbd "C-v") 'yank)
(global-set-key (kbd "C-z") 'undo)

;; filename
(defun file-name-only ()
  "Get the current buffer file name without directory."
  (file-name-nondirectory (buffer-name)))

(defun file-name-only-noext ()
  "Get the current buffer file name without directory and extension."
  (file-name-sans-extension (file-name-only)))

;; inline comment M-;
(defun inline-comment-dwim-line (&optional arg)
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
     (comment-dwim arg)))

(global-set-key "\M-;" 'inline-comment-dwim-line)

;; go to middle C-z
;; (defun middle-of-line ()
;;   "Put cursor at the middle point of the line."
;;   (interactive)
;;   (goto-char (/ (+ (point-at-bol) (point-at-eol)) 2)))
;; (global-set-key (kbd "C-z") 'middle-of-line)

;; move to next line
(defun move-to-next-line ()
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(global-set-key (kbd "<C-return>") 'move-to-next-line)

;; move to last line
(defun move-to-last-line ()
  (interactive)
  (move-beginning-of-line 1)
  (newline)
  (previous-line 1))

(global-set-key (kbd "<S-return>") 'move-to-last-line)

;; find all funcs
;; (defun list-funcs (arg)
;;   "List functions in buffer."
;;   (interactive "p")
;;   (message "functions")
;;   (list-matching-lines "^[A-Za-z0-9_]+[ ]+[A-Za-z0-9_<>: ]*[\(]"))

;; delete word or whitespace
(defun delete-backward-word-or-whitespace ()
  "Delete the word before the cursor, or all whitespace if the cursor is in whitespace."
  (interactive)
  ;; if the last word is whitespace, skip them and delete
  (if (or (looking-back "^[ \t\n]*" nil)
	  (looking-back "[ \t\n]+" nil))
      (delete-region (point)
		     (progn (skip-chars-backward " \t\n") (point)))
    ;; else kill one word
    (backward-kill-word 1)))

(global-set-key (kbd "C-<backspace>") 'delete-backward-word-or-whitespace)

;; delete word or whitespace
(defun delete-forward-word-or-whitespace ()
  "Delete the word before the cursor, or all whitespace if the cursor is in whitespace."
  (interactive)
  ;; if the current word is whitespace, skip them and delete
  (if (looking-at "[ \t\n]+")
      (delete-region (point)
		     (progn (skip-chars-forward " \t\n") (point)))
    ;; else kill one word
    (kill-word 1)))
  
(global-set-key (kbd "M-<backspace>") 'delete-forward-word-or-whitespace)

(defun delete-next-char ()
  "Delete the next character after the cursor."
  (interactive)
  (delete-char 1))

;; qucik move
(global-set-key (kbd "C-,") 'backward-char)
(global-set-key (kbd "C-.") 'forward-char)

(defun move-left-word-or-whitespace ()
  "Move left by one word or skip whitespace and newlines."
  (interactive)
  (if (looking-back "[ \t\n]+" nil)
      (skip-chars-backward " \t\n")
    (backward-word 1)))

(global-set-key (kbd "M-,") 'move-left-word-or-whitespace)

(defun move-right-word-or-whitespace ()
  "Move right by one word or skip whitespace and newlines."
  (interactive)
  (if (looking-at "[ \t\n]+")
      (skip-chars-forward " \t\n")
    (forward-word 1)))

(global-set-key (kbd "M-.") 'move-right-word-or-whitespace)

(defun move-down-to-empty-line ()
  "Move cursor down until it reaches an empty line."
  (interactive)
  (forward-line 1)
  (while (and (not (eobp)) ; Check not at end of buffer
              (not (looking-at "^$"))) ; Check current line not empty
    (forward-line 1)))

(global-set-key (kbd "M-n") 'move-down-to-empty-line)

(defun move-up-to-empty-line ()
  "Move cursor up until it reaches an empty line."
  (interactive)
  (forward-line -1)
  (while (and (not (bobp)) ; Check not at beginning of buffer
              (not (looking-at "^$"))) ; Check current line not empty
    (forward-line -1)))

(global-set-key (kbd "M-p") 'move-up-to-empty-line)

;; provide mod name
(provide 'init-kbd)
