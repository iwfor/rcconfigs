;; Functions for keybindings
(defun open-line-below-like-vim ()
  "Open a line below the point, and move there"
  (interactive)
  (move-end-of-line 1)
  (newline)
  (indent-according-to-mode))

(defun open-line-above-like-vim ()
  "Open a line above the point, and move there"
  (interactive)
  (move-beginning-of-line 1)
  (newline)
  (previous-line)
  (indent-according-to-mode))

(defun switch-to-previous-buffer ()
  "Switch back to the previous buffer"
  (interactive)
  (switch-to-buffer (other-buffer)))

(defun kill-region-or-backward-kill-word (arg)
  "If there is a region, kill it.  Otherwise kill the word before point"
  (interactive "*p")
  (if (and transient-mark-mode mark-active)
      (kill-region (region-beginning) (region-end))
    (backward-kill-word arg)))

(defun save-to-kill-ring-and-normalize-whitespace ()
  (interactive)
  (let ((text (buffer-substring (region-beginning) (region-end))))
    (kill-new
     (replace-regexp-in-string "^\s+" "" (replace-regexp-in-string "\n\s*" " " text))))
  (deactivate-mark))

;; Based on smart tab: http://www.emacswiki.org/cgi-bin/emacs-en/TabCompletion
(defvar nosci-inside-smart-tab nil)

(defun nosci-smart-org-cycle ()
  "Prevent recursion with org-mode"
  (if (not nosci-inside-smart-tab)
      (let ((nosci-inside-smart-tab t)) (org-cycle))
    (indent-for-tab-command)))

(defun nosci-smart-tab ()
  "Context based tab key.  If there is a region, indent the
  region.  Otherwise attempt to perform tab completion or
  indentation."
  (interactive)
  (cond
   ((minibufferp) (minibuffer-complete))
   ((string= major-mode "org-mode") (nosci-smart-org-cycle))
   (mark-active (indent-region (region-beginning) (region-end)))
   ((looking-at "\\_>") (hippie-expand nil))
   (t (indent-for-tab-command))))

;; Better buffer menu
(defun nosci-buffer-menu (&optional arg)
  "Load a buffer-menu and when it quits, restore the window configuration"
  (interactive "P")
  (let ((window-conf (current-window-configuration)))
    (buffer-menu-other-window arg)
    (set (make-local-variable 'nosci-saved-window-configuration) window-conf)
    (define-key Buffer-menu-mode-map "q" 'nosci-quit-buffer-menu)))

(defun nosci-quit-buffer-menu ()
  "Restore the window configuration, closing a buffer window"
  (interactive)
  (let ((window-conf nosci-saved-window-configuration))
    (when window-conf (set-window-configuration window-conf))))

;; For Macintosh Emacs only
(setq mac-option-modifier  'hyper)
(setq mac-command-modifier 'meta)

;; Global Key Bindings
(define-key global-map "\C-x\C-m" 'execute-extended-command)
(define-key global-map "\C-x\C-b" 'nosci-buffer-menu)
(define-key global-map "\C-o"     'open-line-below-like-vim)
(define-key global-map "\M-o"     'open-line-above-like-vim)
(define-key global-map "\C-s"     'isearch-forward-regexp)
(define-key global-map "\C-r"     'isearch-backward-regexp)
(define-key global-map "\C-\M-s"  'isearch-forward)
(define-key global-map "\C-\M-r"  'isearch-backward)
(define-key global-map "\C-xx"    'switch-to-previous-buffer)
(define-key global-map "\C-w"     'kill-region-or-backward-kill-word)
(define-key global-map "\M-z"     'zap-up-to-char)
(define-key global-map "\M-\S-z"  'zap-to-char)
(define-key global-map "\t"       'nosci-smart-tab)
(global-set-key "\M-s" 'save-buffer)

;; User Key Bindings (using the C-c prefix)
(define-key global-map "\C-ca"    'org-agenda)
(define-key global-map "\C-cd"    'delete-trailing-whitespace)
(define-key global-map "\C-cl"    'org-store-link)
(define-key global-map "\C-cm"    'magit-status)
(define-key global-map "\C-cr"    'revert-buffer)
(define-key global-map "\C-cu"    'goto-last-change)
(define-key global-map "\C-c\M-w" 'save-to-kill-ring-and-normalize-whitespace)

;; Hyper Keys
(define-key global-map (kbd "H-m") 'bm-toggle)
(define-key global-map (kbd "H-p") 'bm-previous)
(define-key global-map (kbd "H-n") 'bm-next)
(define-key global-map (kbd "H-a") 'align)

;; Key Bindings for Working with Windows
(define-key global-map [(meta down)]     'shrink-window)              ; Make window smaller (vertical)
(define-key global-map [(meta up)]       'enlarge-window)             ; Make window bigger (vertical)
(define-key global-map [(meta left)]     'shrink-window-horizontally) ; Make window smaller
(define-key global-map [(meta right)]    'enlarge-window-horizontally); Make window bigger

;; I freaking hate C-z (unless I'm using ElScreen)
(if (fboundp 'elscreen-create) 
    (define-key global-map "\C-z\C-z" 'elscreen-toggle)
  (define-key global-map "\C-z" nil))

(define-key global-map (kbd "C-?") 'redo)
(define-key global-map (kbd "C-<next>") 'next-buffer)
(define-key global-map (kbd "C-<prior>") 'previous-buffer)
