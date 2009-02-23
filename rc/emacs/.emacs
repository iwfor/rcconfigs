; Things to do when editing text files
(setq default-major-mode  'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'flyspell-mode)

; Load nosci Custom Files
(load "~/.emacs.d/nosci/nosci-loadpath")
(load "~/.emacs.d/nosci/nosci-options")
(load "~/.emacs.d/nosci/nosci-packages")
(load "~/.emacs.d/nosci/nosci-keybindings")
(load "~/.emacs.d/nosci/nosci-programming")
(load "~/.emacs.d/nosci/nosci-colors")
(load "~/.emacs.d/nosci/nosci-term")
(load "~/.emacs.d/nosci/nosci-server")
(load "~/.emacs.d/nosci/nosci-local")

; Stuff for the custom interface (not used)
(setq custom-file "~/.emacs.d/nosci/nosci-custom.el")
