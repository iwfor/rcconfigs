;;; cperl-mode is preferred to perl-mode                                        
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))

(add-hook 'cperl-mode-hook
          (lambda ()
            (nosci-cperl-mode-hook)
            (define-key cperl-mode-map (kbd "TAB") 'nosci-smart-tab)
            (define-key cperl-mode-map "\C-m"      'nosci-newline)))
