;; Muse Mode
(require 'muse-html)
(require 'muse-latex)
(require 'muse-barecms)

;; Muse Projects
(setq nosci:test-src-path "~/Develop/nosci/barecms/test/muse"
      nosci:test-dst-path "~/Develop/tmp/barecms-test"
      nosci:sc-src-path   "~/Develop/nosci/sc-trunk/doc"
      nosci:sc-dst-path   "~/Develop/tmp/sc-docs")

(setq muse-project-alist
      `(("nosci.net"
         (,@(muse-project-alist-dirs nosci-net-src) :default "index" :set (muse-barecms-url "http://nosci.net"))
         ,@(muse-project-alist-styles nosci-net-src nosci-net-dst "barecms" :include "\\.muse$" :exclude "/snippets/"))
        ("muse-barecms-test"
         (,@(muse-project-alist-dirs nosci:test-src-path) :default "index" :set (muse-barecms-url "http://localhost:3000" muse-barecms-base-path "/test/"))
         ,@(muse-project-alist-styles nosci:test-src-path nosci:test-dst-path "barecms" :include "\\.muse$"))
        ("labs/sva"
         (,@(muse-project-alist-dirs nosci:sc-src-path) :default "index" :set (muse-barecms-url "http://nosci.net" muse-barecms-base-path "/labs/sva/"))
         ,@(muse-project-alist-styles nosci:sc-src-path nosci:sc-dst-path "barecms" :include "\\.muse$"))))

(setq nosci-muse-html-header
      "<html>
       <head><title><lisp>(muse-publishing-directive \"title\")</lisp></title>
       <link href=\"<lisp>nosci-print-css</lisp>\" media=\"all\" rel=\"stylesheet\" type=\"text/css\"/></head>
       <body><lisp>muse-barecms-header</lisp>")

(setq 
 muse-latex-header "~/Develop/nosci/rc/latex/muse.tex"
 muse-completing-read-function 'ido-completing-read
 muse-colors-autogen-headings nil
 muse-html-table-attributes " class=\"muse-table\" cellpadding=\"0\" cellspacing=\"0\"")

(muse-derive-style "printable-xhtml" "xhtml"
                   :header 'nosci-muse-html-header)

(muse-derive-style "pdf-logo-article" "pdf"
                   :header "~/Develop/nosci/rc/latex/muse/logo-article.tex")
