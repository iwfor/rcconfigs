;;; Local settings based on host name

(defun nosci-local-settings ()
  (let ((host (replace-regexp-in-string "\n" "" (shell-command-to-string "hostname"))))
    (cond
     ((string= "nodoubt.local" host) (nosci-local:nodoubt))
    )
  )
)

(defun nosci-center-frame (frame)
  "Move the frame to the center of the screen.  The screen space
reported by the `display-pixel-height' function will be adjusted
to account for a missing Mac OS X menu bar."
  (let* ((display-w (display-pixel-width))
         (display-h (- (display-pixel-height) 38)) ; hide title bar
         (frame-w (frame-pixel-width frame))
         (frame-h (frame-pixel-height frame))
         (left (- (/ display-w 2) (/ frame-w 2)))
         (top  (- (/ display-h 2) (/ frame-h 2))))
    (set-frame-position frame left top)))

(defun nosci-local:nodoubt ()
  "Settings for my MacBook Pro"
  (let ((frame (selected-frame)))
    (set-frame-size frame 203 54)
    (nosci-center-frame frame)
  )
)


(defun nosci-local:gui-specific ()
  "Settings for the GUI Emacs."
  (dotimes (i 4) (elscreen-create))
  (elscreen-goto 0))

;; These settings only take affect if we're running the GUI.
(when window-system
  (add-hook 'window-setup-hook 'nosci-local-settings t)
  (add-hook 'window-setup-hook 'nosci-local:gui-specific t))

(defun split-horizontally-for-temp-buffers ()
 "Split the window horizontally for temp buffers."
 ;(interactive)
 (when (one-window-p t) 
  (split-window-horizontally)))
(add-hook 'temp-buffer-setup-hook 'split-horizontally-for-temp-buffers)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(defun switch-to-previous-buffer ()
  "Switch back to the previous buffer"
  (interactive)
  (switch-to-buffer (other-buffer)))
