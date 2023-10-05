;;;; glibc-locales is always required so Guix can find the locale
;;;; everything else I do in alphabetical order making it easy to maintain
(specifications->manifest
    '( "glibc-locales"
       "guile"
       "hello"
       "guile-gnutls"
       "guile-git"
       "guile-commonmark"
       ))
