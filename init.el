;; (package-initialize)
;; (add-to-list 'load-path "~/benchmark-init-el")
;; (require 'benchmark-init-loaddefs)
;; (benchmark-init/activate)

(setenv "SPACEMACSDIR" "~/.emacs.d/")
(defvar dotspacemacs-filepath "~/.emacs.d/spacemacs.el")
(defvar spacemacs-start-directory "~/.emacs.d/spacemacs/")
(load-file "~/.emacs.d/spacemacs/init.el")
