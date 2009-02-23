;; Places I keep elisp files
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/nosci")
(add-to-list 'load-path "~/.emacs.d/packages")
(add-to-list 'load-path "~/.emacs.d/packages/cedet/common")
(add-to-list 'load-path "~/.emacs.d/packages/ecb")

;; Local site-lisp
(setq nosci-site-lisp
      (cond
       ((file-exists-p "~/Local/share/emacs/site-lisp")   "~/Local/share/emacs/site-lisp")
       ((file-exists-p "/usr/local/share/emacs/site-lisp") "/usr/local/share/emacs/site-lisp")))

(add-to-list 'load-path nosci-site-lisp)
(add-to-list 'load-path (concat nosci-site-lisp "/apel"))
(add-to-list 'load-path (concat nosci-site-lisp "/emu"))

;; Gnus
(add-to-list 'load-path (concat nosci-site-lisp "/gnus/lisp"))
