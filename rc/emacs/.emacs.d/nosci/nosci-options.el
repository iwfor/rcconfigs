(setq
 user-full-name "Isaac Foraker"
 user-mail-address "isaac@nosci.net"
 nosci-net-src "~/Documents/nosci/nosci.net"
 nosci-net-dst (concat nosci-net-src "/published")
 nosci-print-css "http://nosci.net/static/stylesheets/print.css")

;; Misc
(pc-selection-mode 1)
(global-hl-line-mode 1)
(setq scroll-step 1)
;(type-break-mode nil)

;; Interface Options (remove some interface elements, such as the toolbar, scroll bar, and menu bar.
;; The menu bar is only removed from non-GUI versions of emacs
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(and terminal-frame (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; General options
(setq
 inhibit-startup-message t        ; I've seen it already
 ring-bell-function (lambda ())   ; kill those damn bells
 visible-bell nil                 ; no visual bell
 column-number-mode t             ; display column number in mode line
 enable-recursive-minibuffers t   ; allow multiple minibuffers
 echo-keystrokes 0.1              ; show unfinished keystrokes early
 disabled-command-hook nil)       ; Enable commands disabled by default for novice users

;; Aliases
(defalias 'yes-or-no-p 'y-or-n-p)

;; Frame setup
(setq
 default-frame-alist '((cursor-type  . bar) (cursor-color . "yellow")))

;; Redo command
(require 'redo)

;; Cedet packages
(require 'cedet)
;; Enabling various SEMANTIC minor modes.  See semantic/INSTALL for more ideas.
;; Select one of the following:

;; * This enables the database and idle reparse engines
;;(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
(semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as the nascent intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-guady-code-helpers)

;; * This turns on which-func support (Plus all other code helpers)
;; (semantic-load-enable-excessive-code-helpers)

;; This turns on modes that aid in grammar writing and semantic tool
;; development.  It does not enable any other features such as code
;; helpers above.
;; (semantic-load-enable-semantic-debugging-helpers)

;; ECB (Emacs Code Browser)
(require 'ecb)
;;(ecb-activate)

;; Window Fringes
(require 'fringe)
(setq default-indicate-buffer-boundaries 'left) ; Indicate the top and bottom of a buffer
(setq default-indicate-empty-lines t)           ; Display an indicator for lines beyond the buffer EOF
(fringe-mode 'default)

;; Font lock mode (syntax coloring)
(setq font-lock-maximum-decoration t)
(global-font-lock-mode t)

;; White-space and Special Characters
(set-default 'require-final-newline t)
(setq next-line-add-newlines nil)
(setq-default indent-tabs-mode nil)
(setq default-truncate-lines t)
(setq paren-priority 'both)
(setq paren-sexp-mode nil)
(setq paren-match-face 'show-paren-match-face)
(setq mark-even-if-inactive t)
(show-paren-mode t)
(transient-mark-mode t)

;; Use numbered backups, but keep them from cluttering up working directories
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)
(setq version-control t)
(setq backup-by-copying t)
