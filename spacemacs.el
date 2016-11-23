;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ivy
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-sort-by-usage t)
     better-defaults
     emacs-lisp
     git
     org
     (shell :variable
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     (syntax-checking :variables
                      syntax-checking-use-original-bitmaps t)
     (version-control :variables
                      version-control-diff-tool 'git-gutter)
     semantic
     pdf-tools
     nlinum
     imenu-list
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(evil-easymotion)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading t
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         ;; gruvbox
                         ;; solarized-dark
                         zenburn
                         ;; monokai
                         ;; spacemacs-dark
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Fira Mono"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.2)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non-nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non-nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non-nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non-nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.2
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non-nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non-nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;; (setq custom-file (concat dotspacemacs-directory "custom.el"))
  ;; (unless (file-exists-p custom-file)
  ;;   (write-region "" nil custom-file))
  ;; (load custom-file)

  (message "finished user-init ok")
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; (eval-when-compile (unless load-file-name
  ;;                      ()
  ;;                      (setq gc-cons-threshold 100000000)
  ;;                      ;; (setenv "SPACEMACSDIR" "~/.emacs.d/")
  ;;                      (defvar spacemacs-start-directory "~/.emacs.d/spacemacs/")
  ;;                      (defvar dotspacemacs-filepath "~/.emacs.d/spacemacs.el")
  ;;                      (defvar dotspacemacs-directory nil)
  ;;                      (defvar dotspacemacs-configuration-layers)
  ;;                      (defvar dotspacemacs-distribution)
  ;;                      (defvar configuration-layer--used-layers)
  ;;                      (load-file (concat spacemacs-start-directory "core/core-load-paths.el"))
  ;;                      (require 'core-spacemacs)
  ;;                      (require 'core-configuration-layer)
  ;;                      (require 'eieio)
  ;;                      (load-file dotspacemacs-filepath)
  ;;                      ;; (configuration-layer/initialize)
  ;;                      ;; (advice-add #'make-hash-table :around (lambda (f &rest args)
  ;;                      ;;                                         (funcall f :size 300)))
  ;;                      (dotspacemacs/layers)
  ;;                      (configuration-layer/discover-layers)
  ;;                      ;; (configuration-layer//declare-used-layers dotspacemacs-configuration-layers)
  ;;                      ;; (error "this is a error %s" "aaaaaaaaaaa")
  ;;                      ;; (warn "aaaaaaa")
  ;;                      (setq configuration-layer--used-layers nil)
  ;;                      (let ((configuration-layer--declared-layers-usedp t))
  ;;                        ;; (dolist (layer-specs dotspacemacs-configuration-layers)
  ;;                        ;;   (let* ((layer-name (or (car-safe layer-specs) layer-specs))
  ;;                        ;;          (layer (configuration-layer/get-layer layer-name)))
  ;;                        ;;     (if layer
  ;;                        ;;         (let ((layer-path (eieio-oref layer :dir)))
  ;;                        ;;           (unless (string-match-p "+distributions" layer-path)
  ;;                        ;;             (configuration-layer/declare-layer layer-specs)))
  ;;                        ;;       )))
  ;;                        ;; (configuration-layer/declare-layer dotspacemacs-distribution)
  ;;                        (let* ((layer-specs dotspacemacs-distribution)
  ;;                               (layer-name (if (listp layer-specs) (car layer-specs) layer-specs))
  ;;                               (layer (configuration-layer/get-layer layer-name))
  ;;                               (usedp configuration-layer--declared-layers-usedp))
  ;;                          (if layer
  ;;                              (let ((obj (configuration-layer/make-layer
  ;;                                          layer-specs
  ;;                                          (configuration-layer/get-layer layer-name)
  ;;                                          usedp)))
  ;;                                (configuration-layer//add-layer obj usedp)
  ;;                                (configuration-layer//set-layer-variables obj)
  ;;                                (when (or usedp configuration-layer--load-packages-files)
  ;;                                  (configuration-layer//load-layer-files layer-name '("layers.el")))
  ;;                                )
  ;;                            )
  ;;                          )
  ;;                        ;; (configuration-layer/declare-layer 'spacemacs-bootstrap)
  ;;                        )
  ;;                      ))


  (eval-when-compile
    (unless (or load-file-name (featurep 'core-spacemacs))
      (setenv "SPACEMACSDIR" "~/.emacs.d/")
      (defvar dotspacemacs-filepath "~/.emacs.d/spacemacs.el")
      (defvar spacemacs-start-directory "~/.emacs.d/spacemacs/")

      (setq gc-cons-threshold 100000000)

      (defconst spacemacs-version          "0.200.5" "Spacemacs version.")
      (defconst spacemacs-emacs-min-version   "24.4" "Minimal version of Emacs.")

      (if (not (version<= spacemacs-emacs-min-version emacs-version))
          (message (concat "Your version of Emacs (%s) is too old. "
                           "Spacemacs requires Emacs version %s or above.")
                   emacs-version spacemacs-emacs-min-version)
        (load-file "~/.emacs.d/spacemacs/core/core-load-paths.el")
        (require 'core-spacemacs)
        (spacemacs/init)
        (configuration-layer/sync t))))

  (require 'cl-lib)
  (require 'avy)

  (global-company-mode)
  (spacemacs/toggle-automatic-symbol-highlight-on)
  (spacemacs/toggle-highlight-current-line-globally-off)
  (spacemacs/toggle-display-time-on)
  (setq org-bullets-bullet-list '("•"))
  (setq powerline-default-separator 'arrow)

  (defun my-exec-func (func)
    (ignore-errors (funcall-interactively func) t))

  (defun my-collect (func &optional thing)
    (assert (commandp func))
    (my-exec-func func)
    (redisplay)
    (let ((avy-background) (points) (compf)
          (bounds (if thing (bounds-of-thing-at-point thing) (cons (window-start) (window-end))))
          (interrupted t))
      (save-excursion
        (when (my-exec-func func)
          (setq points (list (point)))
          (when (my-exec-func func)
            (setq compf (if (< (car points) (point)) '< '>))
            (while-no-input
              (when (and compf (car points))
                (while (and (<= (car bounds) (point) (cdr bounds))
                            (funcall compf (car points) (point))
                            (progn (push (point) points)
                                   (my-exec-func func)))))
              (setq interrupted nil)))))
      (unless interrupted
        (evilem--jump (nreverse points)))))

  (with-eval-after-load 'flycheck
   (push 'sentence-end-double-space flycheck-emacs-lisp-checkdoc-variables)
   (cl-delete 'emacs-lisp-checkdoc flycheck-checkers))

  (global-prettify-symbols-mode)
  (add-hook 'prog-mode-hook (lambda ()
                              (mapc (lambda (x) (push x prettify-symbols-alist))
                                    '(("lambda" ?λ) ("<=" . ?≤) (">=" . ?≥) ("!=" . ?≠)))
                              (spacemacs/toggle-syntax-checking-on)))

  (dolist (x '(which-key-mode hybrid-mode company-mode yas-minor-mode))
    (eval `(with-eval-after-load (if (autoloadp (symbol-function x)) (intern (nth 1 (symbol-function x))) 'emacs)
             (setcdr (assoc ',x spacemacs--diminished-minor-modes) '("")))))

  (defface my-dummy-face nil "")

  (defun my-exclude-point-from-search (f symbol range)
    (nconc (funcall f symbol (cons (max (car range) (window-start)) (min (cdr range) (window-end) (1- (point)))))
           (funcall f symbol (cons (max (car range) (window-start) (1+ (point))) (min (cdr range) (window-end))))))
  (advice-add #'ahs-search-symbol :around #'my-exclude-point-from-search)
  (with-eval-after-load 'auto-highlight-symbol
    (dolist (range ahs-range-plugin-list)
      (setcdr (assoc 'face (symbol-value range)) 'my-dummy-face))
    (face-spec-set 'ahs-face '((t :underline t)) 'face-defface-spec)
    (face-spec-set 'ahs-definition-face '((t :box t)) 'face-defface-spec))

  (with-eval-after-load 'semantic
    (add-hook 'semantic-mode-hook
              (lambda () (dolist (x (default-value 'completion-at-point-functions))
                      (when (string-prefix-p "semantic-" (symbol-name x))
                        (remove-hook 'completion-at-point-functions x))))))

  (defun my-force-diminish-ascii (f &rest args)
    (let ((dotspacemacs-mode-line-unicode-symbols nil))
      (apply f args)))
  (advice-add #'spacemacs/diminish-hook :around #'my-force-diminish-ascii)
  (advice-add #'spacemacs//prepare-diminish :around #'my-force-diminish-ascii)

  (setq spacemacs-version-check-interval "14400")
  (setq spacemacs-version--startup-check-interval 14400)
  (setq spacemacs-checkversion-branch "develop")
  (advice-add #'spacemacs/check-for-new-version :around
              (lambda (f force &optional interval)
                (require 'magit-process)
                (cl-letf (((symbol-function 'spacemacs//git-get-current-branch) (lambda () "dummy"))
                          (can-update (spacemacs//can-check-for-new-version-at-startup)))
                  (funcall f force interval)
                  (when (and (not spacemacs-new-version)
                             (or force (and can-update dotspacemacs-check-for-update))
                             (let ((default-directory (file-truename spacemacs-start-directory)))
                               (magit-run-git "fetch")
                               (not (magit-rev-eq "@" "origin/develop"))))
                    (setq spacemacs-new-version "git-latest")
                    (message "New version of Spacemacs available: git-latest")))))
  (copy-face 'spacemacs-mode-line-new-version-lighter-success-face 'spacemacs-mode-line-new-version-lighter-git-face)
  (defface spacemacs-mode-line-new-version-lighter-git-face '((t :foreground "dark cyan" :inherit spacemacs-mode-line-new-version-lighter-success-face)) "")
  (advice-add #'spacemacs/get-new-version-lighter-face :around (lambda (f current new)
                                                                 (if (equal new "git-latest")
                                                                     'spacemacs-mode-line-new-version-lighter-git-face
                                                                   (funcall f current new))))
  (defun my-update-spacemacs ()
    (interactive)
    (magit-status-internal spacemacs-start-directory)
    (magit-pull "origin" "--rebase"))
  (spacemacs/set-leader-keys "ous" #'my-update-spacemacs)
  (defun my-update-packages ()
    (interactive)
    (unless (eq (current-buffer) (get-buffer "*spacemacs*"))
      (view-buffer-other-window "*spacemacs*"))
    (configuration-layer/update-packages))
  (spacemacs/set-leader-keys "oup" #'my-update-packages)
  (spacemacs/set-leader-keys ":" #'evil-ex)

  (setq avy-style 'at)
  (setq avy-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l ?\; ?\'
                      ?\t ?q ?w ?e ?r ?u ?i ?o ?p ?\[
                      ?c ?v ?n ?m ?\s))
  (advice-add #'avy--key-to-char :around (lambda (f c) (case c (?\s ?␣) (?\t ?→) (t (funcall f c)))))


  (defun my-do-in-normal-state ()
    (interactive)
    (evil-normal-state)
    (right-char)
    (call-interactively (key-binding (this-single-command-keys))))
  (mapc (lambda (x) (evil-global-set-key 'hybrid x #'my-do-in-normal-state))
        '([down-mouse-1] [down] [up] [left] [right]))

  ;; escape key nonsense
  (setq evil-esc-delay .25)
  (defun my-escape-intercept (_)
    (if (or executing-kbd-macro evil-inhibit-esc) [escape] (evil-esc [?\e])))
  (defun evil-esc (map)
    (let ((len (length (this-single-command-keys))) (key nil))
      (cond ((or executing-kbd-macro evil-inhibit-esc) map)
            ((and (= 1 len) (sit-for evil-esc-delay))
             (when defining-kbd-macro
               (end-kbd-macro)
               (setq last-kbd-macro (vconcat last-kbd-macro [escape]))
               (start-kbd-macro t t))
             [escape])
            ((= 1 len) map)
            ((setq key (read-event nil t evil-esc-delay))
             (when (eq 'escape key) (setq key ?\e))
             (if (and (keymapp map) (not (eq t (lookup-key `(keymap ,map (t . t)) `[,key] t))))
                 (lookup-key map key)
               `[,(event-convert-list `(meta ,key))]))
            ([escape]))))
  (define-key input-decode-map [escape] #'my-escape-intercept)

  (defvar my-escape-recur nil)
  (defun my-overriding-escape (_)
    (interactive)
    (if-let (my-escape-recur (and (= 1 (length (this-command-keys))) (not my-escape-recur)))
        (cond ((or (region-active-p) prefix-arg) #'keyboard-quit)
              ((active-minibuffer-window) #'minibuffer-keyboard-quit)
              ((if-let ((qfunc (key-binding [?q]))
                        (qdoc (if (functionp qfunc) (car (split-string (documentation qfunc) (concat "\\s-*\n\\s-*\\|" (sentence-end)) t)) "")))
                   (when (string-match-p "\\b\\(quit\\|exit\\|toggle\\|off\\|hide\\)\\b" (format "%s %s" qfunc qdoc)) qfunc)))
              ((key-binding [escape]))
              ((let ((efunc (evil-escape-func)))
                 (if (string-prefix-p "evil-" (symbol-name efunc)) #'keyboard-quit efunc))))))
  (define-key override-global-map [escape] `(menu-item "" nil :filter ,#'my-overriding-escape))
  (evil-make-intercept-map override-global-map)

  (defun my-evilem--collect-advice (f func &optional scope all-windows initial-point sort-key collect-postprocess)
    (funcall f func all-windows initial-point sort-key collect-postprocess))
  (advice-add #'evilem--collect :around #'my-evilem--collect-advice)
  (evilem-default-keybindings "ESC")
  (define-key evil-motion-state-map [?\e ?/] #'swiper)
  (with-eval-after-load 'term
    (define-key term-raw-map [?\e ?\e] #'term-send-raw))
  (define-key query-replace-map [?\e] 'quit)
  (define-key query-replace-map [escape] 'quit)

  (message "finished user-config ok"))

;; (unless (featurep 'core-spacemacs)
;;   (setenv "SPACEMACSDIR" "~/.emacs.d/")
;;   (defvar spacemacs-start-directory "~/.emacs.d/spacemacs/")
;;   (defvar dotspacemacs-filepath "~/.emacs.d/init.el")
;;   (advice-add #'spacemacs/maybe-install-dotfile :around #'ignore)
;;   (advice-add #'dotspacemacs/load-file :around #'ignore)
;;   (load-file "~/.emacs.d/spacemacs/init.el")
;;   (advice-remove #'dotspacemacs/load-file #'ignore))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (powerline orgit org-projectile org-present alert log4e nlinum-relative magit-gitflow ivy-purpose window-purpose ivy-hydra imenu-list parent-mode git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ flyspell-correct-ivy pos-tip flx evil-magit magit-popup git-commit iedit anzu evil goto-chg undo-tree highlight f s diminish counsel-projectile projectile pkg-info epl swiper company-statistics bind-map bind-key packed async avy auto-complete popup package-build org-pomodoro spinner hydra dash magit pdf-tools flycheck-pos-tip smartparens counsel helm helm-core xterm-color wgrep stickyfunc-enhance srefactor smex smeargle shell-pop tablist pcache org gntp org-download nlinum mwim multi-term htmlize gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter flyspell-correct flycheck with-editor evil-easymotion eshell-z eshell-prompt-extras esh-help diff-hl ivy company auto-yasnippet zenburn-theme yasnippet ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spacemacs-theme spaceline restart-emacs request rainbow-delimiters quelpa popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-purpose helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
)
