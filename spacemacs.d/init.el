;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
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
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------

     ;; TOOLS
     helm
     spacemacs-layouts
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t)
     ;; Use evil-commentary instead of evil-nerd-commenter
     colors
     docker
     evil-commentary
     evil-cleverparens
     fasd
     (git :variables
          git-magit-status-fullscreen t)
     ;; If you are not using github, this layer will hose you.
     ;; github
     nginx
     org
     restclient
     (shell :variables
            shell-default-shell 'multi-term
            shell-default-height 30
            shell-default-position 'bottom)
     (spell-checking :variables
                     spell-checking-enable-by-default nil)
     syntax-checking
     vagrant
     version-control
     vinegar

     ;; LANGUAGES
     ;; asciidoc
     ;; csharp
     clojure
     emacs-lisp
     ;; erlang
     ;; elixir
     fsharp
     ;; (go :variables
     ;;     go-use-gometalinter t
     ;;     gofmt-cmmand "goimports"
     ;;     go-tab-width 4)
     groovy
     html
     ;; idris
     (java :variables java-backend 'meghanada)
     ;; javascript
     markdown
     ocaml
     ;; php
     ;; racket
     ;; react
     rjsx
     ;; (ruby :variables
     ;;       ruby-test-runner 'minitest
     ;;       ruby-enable-enh-ruby-mode t
     ;;       ruby-version-manager 'chruby)
     ;; ruby-on-rails
     rust
     ;; scheme
     sql
     yaml
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      direnv
                                      inf-clojure
                                      ;; sicp
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
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
   ;; (default 5)
   dotspacemacs-elpa-timeout 5
   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil
   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
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
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(darktooth
                         flatland
                         ;; nord
                         ;; gruvbox
                         ;; material
                         misterioso
                         solarized-dark
                         solarized-light
                         monokai
                         leuven
                         zenburn)
   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
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
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, `J' and `K' move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Home"
   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout t
   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil
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
   ;; If non-nil, the paste transient-state is enabled. While enabled, pressing
   ;; `p' several times cycles through the elements in the `kill-ring'.
   ;; (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
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
   dotspacemacs-maximized-at-startup nil
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
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t
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
   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"
   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil
   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."

  (global-set-key (kbd "C-s") 'isearch-forward-regexp)
  (global-set-key (kbd "C-r") 'isearch-backward-regexp)
  (global-set-key (kbd "C-M-s") 'isearch-forward)
  (global-set-key (kbd "C-M-r") 'isearch-backward)

  (setq-default
   ;; Escape out of "everything with 'jk'"
   evil-escape-key-sequence "jk"
   evil-want-C-i-jump t

   ;; Projectile caching
   projectile-enable-caching t

   ;; Flycheck
   flycheck-check-syntax-automatically '(save mode-enabled)

   ;; ispell
   ispell-program-name "/usr/local/bin/aspell"

   ;; node modules
   node-add-modules-path t

   ;; time format
   display-time-string-forms '(dayname " " 12-hours ":" minutes " " am-pm))

  (display-time-mode 1))

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  ;; persistence with desktop mode.
  ;; (desktop-save-mode t)
  ;; (desktop-read)

  ;; Environment Variables please
  (exec-path-from-shell-copy-envs '("PERL5LIB"
                                    "PERL_LOCAL_LIB_ROOT"
                                    "PERL_MB_OPT"
                                    "PERL_MM_OPT"
                                    "JAVA_HOME"
                                    "GOPATH"
                                    "NVM_DIR"))

  ;; direnv hookups
  (require 'direnv)
  (direnv-mode)

  ;; clojure hook-ups
  (dolist (m '(clojure-mode-hook cider-mode-hook cider-repl-mode-hook))
    (progn
      ;; For docstrings, I want to be able to use `...`
      (sp-local-pair m "`" "`")
      ;; Trying out cleverparens
      (add-hook m #'evil-cleverparens-mode)))

  (with-eval-after-load 'clojure-mode
    (define-clojure-indent
      (defui '(:defn nil nil (:defn)))
      (specification :defn)
      (behavior :defn)
      (component :defn)
      (provided :defn)
      (assertions 0)
      (when-mocking 0)
      (a :defn)
      (abbr :defn)
      (address :defn)
      (area :defn)
      (article :defn)
      (aside :defn)
      (audio :defn)
      (b :defn)
      (base :defn)
      (bdi :defn)
      (bdo :defn)
      (big :defn)
      (blockquote :defn)
      (body :defn)
      (br :defn)
      (button :defn)
      (canvas :defn)
      (caption :defn)
      (cite :defn)
      (code :defn)
      (col :defn)
      (colgroup :defn)
      (data :defn)
      (datalist :defn)
      (dd :defn)
      (del :defn)
      (details :defn)
      (dfn :defn)
      (dialog :defn)
      (div :defn)
      (dl :defn)
      (dt :defn)
      (em :defn)
      (embed :defn)
      (fieldset :defn)
      (figcaption :defn)
      (figure :defn)
      (footer :defn)
      (form :defn)
      (h1 :defn)
      (h2 :defn)
      (h3 :defn)
      (h4 :defn)
      (h5 :defn)
      (h6 :defn)
      (head :defn)
      (header :defn)
      (hr :defn)
      (html :defn)
      (i :defn)
      (iframe :defn)
      (img :defn)
      (ins :defn)
      (kbd :defn)
      (keygen :defn)
      (label :defn)
      (legend :defn)
      (li :defn)
      (link :defn)
      (main :defn)
      ;; there is a map tag ... really
      ;; (map :defn)
      (mark :defn)
      (menu :defn)
      (menuitem :defn)
      (meta :defn)
      (meter :defn)
      (nav :defn)
      (noscript :defn)
      (object :defn)
      (ol :defn)
      (optgroup :defn)
      (option :defn)
      (output :defn)
      (p :defn)
      (param :defn)
      (picture :defn)
      (pre :defn)
      (progress :defn)
      (q :defn)
      (rp :defn)
      (rt :defn)
      (ruby :defn)
      (s :defn)
      (samp :defn)
      (script :defn)
      (section :defn)
      (select :defn)
      (small :defn)
      (source :defn)
      (span :defn)
      (strong :defn)
      (style :defn)
      (sub :defn)
      (summary :defn)
      (sup :defn)
      (table :defn)
      (tbody :defn)
      (td :defn)
      (tfoot :defn)
      (th :defn)
      (thead :defn)
      (time :defn)
      (title :defn)
      (tr :defn)
      (track :defn)
      (u :defn)
      (ul :defn)
      (var :defn)
      (video :defn)
      (wbr :defn)

      ;; svg
      (circle :defn)
      (clipPath :defn)
      (ellipse :defn)
      (g :defn)
      (line :defn)
      (mask :defn)
      (path :defn)
      (pattern :defn)
      (polyline :defn)
      (rect :defn)
      (svg :defn)
      (text :defn)
      (defs :defn)
      (linearGradient :defn)
      (polygon :defn)
      (radialGradient :defn)
      (stop :defn)
      (tspan :defn)
 ))

  (with-eval-after-load 'clj-refactor
    (define-key clj-refactor-map "/" nil)
    (evil-define-key 'insert clj-refactor-map (kbd "s-/") 'cljr-slash))

  (require 'ob-clojure)
  (setq org-babel-clojure-backend 'cider)

  ;; elisp
  (add-hook 'emacs-lisp-mode-hook #'evil-cleverparens-mode)

  ;; For whatever reason, powerline default separator breaks search. -> https://github.com/syl20bnr/spacemacs/issues/9220
  ;; (setq powerline-default-separator 'nil
  ;;       eclim-eclipse-dirs  "/Users/Mark/eclipse/java-neon/Eclipse.app/Contents/Eclipse"
  ;;       eclim-executable  "/Users/Mark/eclipse/java-neon/Eclipse.app/Contents/Eclipse/eclim")

  ;; csharp
  ;; (setq-default omnisharp-server-executable-path "/Users/Mark/workspace/csharp/omnisharp-roslyn/artifacts/publish/OmniSharp/default/netcoreapp1.1/OmniSharp")
  ;; (setq omnisharp-use-http t)

  ;; HTML
  (defun my-web-mode-hook ()
    "Hooks for web-mode."
    (setq web-mode-markup-indent-offset 4))
  (add-to-list 'auto-mode-alist '("\\.shtml\\'" . web-mode))
  (add-hook 'web-mode-hook 'my-web-mode-hook)

  ;; JAVASCRIPT REACT
  (setq-default
   ;; js2-mode
   js2-basic-offset 2
   ;; web-mode
   css-indent-offset 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2)

  (with-eval-after-load 'sql
    ;; sql-mode pretty much requires your psql to be uncustomized.
    (push "--no-psqlrc" sql-postgres-options))

  ;; custom key-binding for evil mode.
  ;; the (kbd arg) allows binging from keyboard with control, meta, and shift operators.
  (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
  (define-key evil-motion-state-map (kbd "C-h") 'evil-window-left)
  (define-key evil-motion-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-motion-state-map (kbd "C-k") 'evil-window-up)
  (define-key evil-motion-state-map (kbd "C-l") 'evil-window-right)
  ;; for shells, rebind in normal mode
  (with-eval-after-load 'term
      (evil-define-key 'normal term-raw-map
     (kbd "C-k") 'evil-window-up
     (kbd "C-j") 'evil-window-down))

  ;; I needs me arrows
  (define-key evil-insert-state-map (kbd "C-l") "=> ")
  (define-key evil-insert-state-map (kbd "C-k") "-> ")
  (define-key evil-insert-state-map (kbd "C-j") "->> ")
  (define-key evil-insert-state-map (kbd "C-h") "<- ")

  ;; swap 0 and ^ because getting to 0 is easier and first non blank is more useful.
  (define-key evil-normal-state-map "^" 'evil-beginning-of-line)
  (define-key evil-normal-state-map "0" 'evil-first-non-blank)

  (defun connect-planck ()
    (interactive)
    (setq inf-clojure-program '("localhost" . 5555)))

  ;; OSX specific settings.
  (when (equal system-type 'darwin)
    ;;change the command key to the meta key
    (setq mac-option-modifier 'super
          mac-command-modifier 'meta

          ;; dont use native full screen
          ns-use-native-fullscreen nil)

    ;; Toggle me fullscreen timbers with cmd-Enter -- also F11
    (global-set-key (kbd "M-RET") 'toggle-frame-fullscreen))

  ;; windows specific settings
  (when (equal system-type 'windows-nt)

    (add-to-list 'exec-path "C:/Program Files (x86)/Git/bin")

    ;; Make a function that calls the git bash.
    ;; Not currently working
    (defun git-bash ()
      "Run the Msysgit bash shell in shell mode."
      (interactive)
      (let ((explicit-shell-file-name "C:/Program Files (x86)/Git/bin/sh"))
        (call-interactively 'shell)))

    ;; Maximize the window when on Windows
    (defun maximize-frame()
      "Maximize the active from in windows"
      (interactive)
      (w32-send-sys-command 61488))

    ;; hook in on startup
    ;; 24.4 add toggle-frame-maximized and toggle-frame-fullscreen
    (if (functionp 'toggle-frame-maximized)
        (add-hook 'window-setup-hook 'toggle-frame-maximized t)
      (add-hook 'window-setup-hook 'maximize-frame t))
    (if (functionp 'toggle-frame-fullscreen)
        (global-set-key (kbd "M-RET") 'toggle-frame-fullscreen))
    ;; GnuTLS
    (when 'gnutls-available-p
      (setq gnutls-trustfiles "C:/Users/Mark/.ssh/cacert.pem"))

    ;; (prefer-coding-system 'utf-8)
    ;; force unix line endings.
    (prefer-coding-system 'utf-8-unix))

  ;; Linux specific settings
  (when (equal system-type 'gnu/linux)
    (progn
      (defun toggle-fullscreen ()
        (interactive)
        (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                                 nil
                                               'fullboth)))
      (global-set-key [(super return)] 'toggle-fullscreen))))


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm-flyspell company-racer align-cljlet seq geiser omnisharp csharp-mode groovy-mode gradle-mode meghanada restclient-helm ob-restclient company-restclient know-your-http-well edbi epc ctable concurrent deferred sql-indent hide-comnt helm-purpose window-purpose imenu-list pug-mode adoc-mode markup-faces dumb-jump yaml-mode cargo ht org sicp toml-mode racer rust-mode flycheck-rust srefactor idris-mode prop-menu helm-gtags ggtags emoji-cheat-sheet-plus company-emoji marshal evil-unimpaired org-projectile github-search nginx-mode vimrc-mode dactyl-mode noflet ensime sbt-mode scala-mode inf-clojure log4e gntp parent-mode request haml-mode gitignore-mode fringe-helper git-gutter+ logito pcache flx grizzl with-editor goto-chg undo-tree diminish web-completion-data pos-tip inflections edn peg eval-sexp-fu spinner queue pkg-info epl bind-key auto-complete package-build gh highlight paredit emacs-eclim jdee anzu flyspell-correct-helm flyspell-correct auto-dictionary color-identifiers-mode skewer-mode simple-httpd json-snatcher json-reformat dash-functional tern popup rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake f chruby bundler inf-ruby packed git-gutter git-commit nlinum-relative nlinum company iedit multiple-cursors magit-popup hydra smartparens bind-map projectile s evil alert markdown-mode powerline helm helm-core wgrep smex counsel swiper ivy avy yasnippet js2-mode dash cider clojure-mode flycheck magit async racket-mode faceup xterm-color ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit spacemacs-theme spaceline smooth-scrolling smeargle slim-mode shell-pop scss-mode sass-mode restclient restart-emacs rainbow-mode rainbow-identifiers rainbow-delimiters quelpa popwin persp-mode pcre2el paradox page-break-lines orgit org-repo-todo org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file ob-http neotree multi-term move-text mmm-mode markdown-toc magit-gitflow magit-gh-pulls macrostep lorem-ipsum livid-mode linum-relative link-hint leuven-theme less-css-mode json-mode js2-refactor js-doc jade-mode info+ indent-guide ido-vertical-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md flycheck-pos-tip flx-ido flatland-theme fill-column-indicator fasd fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-commentary evil-cleverparens evil-args evil-anzu eshell-z eshell-prompt-extras esh-help erlang emmet-mode elisp-slime-nav diff-hl define-word company-web company-tern company-statistics company-quickhelp column-enforce-mode coffee-mode clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu buffer-move bracketed-paste auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(safe-local-variable-values
   (quote
    ((eval setenv "JVM_OPTS" "-Ddev -Ddbdir=/usr/local/var/postgres")
     (cider-boot-parameters . "cider repl -s wait")
     (cider-boot-parameters . "cider repls -s wait")
     (cider-cljs-lein-repl . "(start-figwheel [\"test\" \"tutorial\"])")
     (clojure-indent-style . :always-align)
     (clojure-indent-style . :always-indent)
     (cider-cljs-lein-repl . "(start-figwheel)")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol t)
 '(package-selected-packages
   (quote
    (solarized-theme projectile-rails feature-mode string-inflection symon nord-theme shut-up browse-at-remote groovy-imports company-emacs-eclim eclim monokai-theme direnv utop tuareg caml ocp-indent merlin go-eldoc magithub minitest enh-ruby-mode go-mode fuzzy darktooth-theme autothemer zenburn-theme ivy-purpose ivy-hydra flyspell-correct-ivy counsel-projectile winum go-guru flycheck-gometalinter dockerfile-mode docker tablist docker-tramp aurora-theme esup seq geiser omnisharp csharp-mode groovy-mode gradle-mode meghanada restclient-helm ob-restclient company-restclient know-your-http-well edbi epc ctable concurrent deferred sql-indent hide-comnt helm-purpose window-purpose imenu-list pug-mode adoc-mode markup-faces dumb-jump yaml-mode cargo ht org sicp toml-mode racer rust-mode flycheck-rust srefactor idris-mode prop-menu helm-gtags ggtags emoji-cheat-sheet-plus company-emoji marshal evil-unimpaired org-projectile github-search nginx-mode vimrc-mode dactyl-mode noflet ensime sbt-mode scala-mode inf-clojure log4e gntp parent-mode request haml-mode gitignore-mode fringe-helper git-gutter+ logito pcache flx grizzl with-editor goto-chg undo-tree diminish web-completion-data pos-tip inflections edn peg eval-sexp-fu spinner queue pkg-info epl bind-key auto-complete package-build gh highlight paredit emacs-eclim jdee anzu flyspell-correct-helm flyspell-correct auto-dictionary color-identifiers-mode skewer-mode simple-httpd json-snatcher json-reformat dash-functional tern popup rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake f chruby bundler inf-ruby packed git-gutter git-commit nlinum-relative nlinum company iedit multiple-cursors magit-popup hydra smartparens bind-map projectile s evil alert markdown-mode powerline helm helm-core wgrep smex counsel swiper ivy avy yasnippet js2-mode dash cider clojure-mode flycheck magit async racket-mode faceup xterm-color ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit spacemacs-theme spaceline smooth-scrolling smeargle slim-mode shell-pop scss-mode sass-mode restclient restart-emacs rainbow-mode rainbow-identifiers rainbow-delimiters quelpa popwin persp-mode pcre2el paradox page-break-lines orgit org-repo-todo org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file ob-http neotree multi-term move-text mmm-mode markdown-toc magit-gitflow magit-gh-pulls macrostep lorem-ipsum livid-mode linum-relative link-hint leuven-theme less-css-mode json-mode js2-refactor js-doc jade-mode info+ indent-guide ido-vertical-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md flycheck-pos-tip flx-ido flatland-theme fill-column-indicator fasd fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-commentary evil-cleverparens evil-args evil-anzu eshell-z eshell-prompt-extras esh-help erlang emmet-mode elisp-slime-nav diff-hl define-word company-web company-tern company-statistics company-quickhelp column-enforce-mode coffee-mode clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu buffer-move bracketed-paste auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(safe-local-variable-values
   (quote
    ((cider-cljs-lein-repl . "(start-figwheel [\"dev\" \"cards\"])")
     (cider-cljs-lein-repl . "(start-figwheel [\"dev\"])")
     (cider-cljs-lein-repl . "(start-figwheel [\"dev\" \"test\"])")
     (eval setq cider-cljs-lein-repl "(start-figwheel)")
     (eval setenv "JVM_OPTS" "-Ddev -Ddbdir=/usr/local/var/postgres")
     (cider-boot-parameters . "cider repl -s wait")
     (cider-boot-parameters . "cider repls -s wait")
     (cider-cljs-lein-repl . "(start-figwheel [\"test\" \"tutorial\"])")
     (clojure-indent-style . :always-align)
     (clojure-indent-style . :always-indent)
     (cider-cljs-lein-repl . "(start-figwheel)")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#FDF4C1" :background "#282828"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
)
