;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t)
     ;; better-defaults
     clojure
     colors
     csharp
     emacs-lisp

     ;; Use evil-commentary instead of evil-nerd-commenter
     evil-commentary
     fsharp
     (git :variables
          git-magit-status-fullscreen t)
     github
     html
     javascript
     markdown
     org
     ;; osx
     restclient
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-shell 'multi-term)
     syntax-checking
     version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '()
                                        ;
                                        ; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed.
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(flatland
                         spacemacs-dark
                         spacemacs-light
                         misterioso
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; Default value is `cache'.
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f) is replaced.
   dotspacemacs-use-ido nil
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state nil
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode t
   ;; Select a scope to highlight delimiters. Possible value is `all',
   ;; `current' or `nil'. Default is `all'
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   )
  ;; User initialization goes here
  (setq-default
   ;; Escape out of "everything with 'jk'"
   evil-escape-key-sequence "jk")

  (add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
  (add-to-list 'magic-mode-alist '("\\.boot\\'" . clojure-mode))
  )

(defun dotspacemacs/config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."
  (setq powerline-default-separator 'box)

  ;; custom key-binding for evil mode.
  ;; the (kbd arg) allows binging from keyboard with control, meta, and shift operators.
  (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

  ;; I needs me arrows
  (define-key evil-insert-state-map (kbd "C-l") "=> ")
  (define-key evil-insert-state-map (kbd "C-k") "-> ")
  (define-key evil-insert-state-map (kbd "C-j") "->> ")
  (define-key evil-insert-state-map (kbd "C-h") "<- ")

  ;; swap 0 and ^ because getting to 0 is easier and first non blank is more useful.
  (define-key evil-normal-state-map "^" 'evil-beginning-of-line)
  (define-key evil-normal-state-map "0" 'evil-first-non-blank)

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
      (global-set-key [(super return)] 'toggle-fullscreen)))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
