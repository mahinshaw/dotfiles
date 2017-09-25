(defconst rjsx-packages
  '(
    add-node-modules-path
    company
    company-flow
    (company-tern :requires company)
    eslintd-fix
    evil-matchit
    flycheck
    impatient-mode
    js-doc
    js2-refactor
    json-mode
    json-snatcher
    prettier-js
    rjsx-mode
    (tern :toggle (rjsx/tern-detect))
    web-beautify
    ))

(defun rjsx/init-eslintd-fix ()
  (use-package eslintd-fix
    :defer t
    :commands eslintd-fix-mode
    :init
    (progn
      (add-hook 'rjsx-mode-hook #'eslintd-fix-mode t))))

(defun rjsx/init-add-node-modules-path ()
  (use-package add-node-modules-path
    :defer t
    :init
    (progn
      (add-hook 'css-mode-hook #'add-node-modules-path)
      (add-hook 'json-mode-hook #'add-node-modules-path)
      ;; (add-hook 'web-typescript-mode-hook #'add-node-modules-path)
      ;; (add-hook 'web-mode-hook #'add-node-modules-path)
      ;; (add-hook 'typescript-mode-hook #'add-node-modules-path)
      (with-eval-after-load 'rjsx-mode
        (add-hook 'rjsx-mode-hook #'add-node-modules-path)))))

(defun rjsx/init-company-tern ()
  (use-package company-tern
    :if (and (configuration-layer/package-used-p 'company)
             (configuration-layer/package-used-p 'tern))
    :defer t
    :init (spacemacs|add-company-backends
            :backends company-tern
            :modes rjsx-mode)))

(defun rjsx/post-init-company-flow ()
  (spacemacs|add-company-backends
    :backends
    '((company-flow :with company-dabbrev-code)
      company-files)))

(defun rjsx/post-init-flycheck ()
  (with-eval-after-load 'flycheck
    (push 'javascript-jshint flycheck-disabled-checkers)
    (push 'json-jsonlint flycheck-disabled-checkers))
  (dolist (mode '(rjsx-mode json-mode))
    (spacemacs/enable-flycheck mode)))

(defun rjsx/post-init-impatient-mode ()
  (spacemacs/set-leader-keys-for-major-mode 'rjsx-mode "i" 'spacemacs/impatient-mode))

(defun rjsx/init-js-doc ()
  (use-package js-doc
    :defer t
    :init
    (progn
      (add-hook 'rjsx-mode-hook 'rjsx/js-doc-require)
      (rjsx/js-doc-set-key-bindings 'rjsx-mode))))

(defun rjsx/init-rjsx-mode ()
  (use-package rjsx-mode
    :defer t
    :init
    (progn
      (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
      ;; Required to make imenu functions work correctly
      (add-hook 'rjsx-mode-hook 'js2-imenu-extras-mode)

      (setq
       js2-mode-show-strict-warnings nil
       js2-mode-show-parse-errors nil
       js-indent-level 2
       js2-basic-offset 2
       js2-strict-trailing-comma-warning nil
       js2-strict-missing-semi-warning nil)

      (advice-add #'js-jsx-indent-line
                  :after
                  #'rjsx/js-jsx-indent-line-align-closing-bracket)
      (add-hook 'rjsx-mode-hook #'rjsx/eslintd-set-flycheck-executable t)
      ;; prefixes
      (spacemacs/declare-prefix-for-mode 'rjsx-mode "mh" "documentation")
      (spacemacs/declare-prefix-for-mode 'rjsx-mode "mg" "goto")
      (spacemacs/declare-prefix-for-mode 'rjsx-mode "mr" "refactor")
      (spacemacs/declare-prefix-for-mode 'rjsx-mode "mz" "folding")
      ;; key bindings
      (spacemacs/set-leader-keys-for-major-mode 'rjsx-mode
        "w" 'js2-mode-toggle-warnings-and-errors
        "zc" 'js2-mode-hide-element
        "zo" 'js2-mode-show-element
        "zr" 'js2-mode-show-all
        "ze" 'js2-mode-toggle-element
        "zF" 'js2-mode-toggle-hide-functions
        "zC" 'js2-mode-toggle-hide-comments)
      )
    :config
    (progn
      (evil-define-key 'normal rjsx-mode-map (kbd "x") 'rjsx-delete-creates-full-tag)
      (evil-define-key 'insert rjsx-mode-map (kbd "C-d") 'rjsx-delete-creates-full-tag)

      (modify-syntax-entry ?_ "w" js2-mode-syntax-table))))

(defun rjsx/post-init-evil-matchit ()
  (add-hook `js2-mode `turn-on-evil-matchit-mode))

(defun rjsx/init-js2-refactor ()
  (use-package js2-refactor
    :defer t
    :init
    (progn
      (add-hook 'rjsx-mode-hook #'rjsx/js2-refactor-require)
      ;; prefixes
      (spacemacs/declare-prefix-for-mode 'rjsx-mode "mr3" "ternary")
      (spacemacs/declare-prefix-for-mode 'rjsx-mode "mra" "add/args")
      (spacemacs/declare-prefix-for-mode 'rjsx-mode "mrb" "barf")
      (spacemacs/declare-prefix-for-mode 'rjsx-mode "mrc" "contract")
      (spacemacs/declare-prefix-for-mode 'rjsx-mode "mre" "expand/extract")
      (spacemacs/declare-prefix-for-mode 'rjsx-mode "mri" "inline/inject/introduct")
      (spacemacs/declare-prefix-for-mode 'rjsx-mode "mrl" "localize/log")
      (spacemacs/declare-prefix-for-mode 'rjsx-mode "mrr" "rename")
      (spacemacs/declare-prefix-for-mode 'rjsx-mode "mrs" "split/slurp")
      (spacemacs/declare-prefix-for-mode 'rjsx-mode "mrt" "toggle")
      (spacemacs/declare-prefix-for-mode 'rjsx-mode "mru" "unwrap")
      (spacemacs/declare-prefix-for-mode 'rjsx-mode "mrv" "var")
      (spacemacs/declare-prefix-for-mode 'rjsx-mode "mrw" "wrap")
      (spacemacs/declare-prefix-for-mode 'rjsx-mode "mx" "text")
      (spacemacs/declare-prefix-for-mode 'rjsx-mode "mxm" "move")
      ;; key bindings
      (spacemacs/set-leader-keys-for-major-mode 'rjsx-mode
        "r3i" 'js2r-ternary-to-if
        "rag" 'js2r-add-to-globals-annotation
        "rao" 'js2r-arguments-to-object
        "rba" 'js2r-forward-barf
        "rca" 'js2r-contract-array
        "rco" 'js2r-contract-object
        "rcu" 'js2r-contract-function
        "rea" 'js2r-expand-array
        "ref" 'js2r-extract-function
        "rem" 'js2r-extract-method
        "reo" 'js2r-expand-object
        "reu" 'js2r-expand-function
        "rev" 'js2r-extract-var
        "rig" 'js2r-inject-global-in-iife
        "rip" 'js2r-introduce-parameter
        "riv" 'js2r-inline-var
        "rlp" 'js2r-localize-parameter
        "rlt" 'js2r-log-this
        "rrv" 'js2r-rename-var
        "rsl" 'js2r-forward-slurp
        "rss" 'js2r-split-string
        "rsv" 'js2r-split-var-declaration
        "rtf" 'js2r-toggle-function-expression-and-declaration
        "ruw" 'js2r-unwrap
        "rvt" 'js2r-var-to-this
        "rwi" 'js2r-wrap-buffer-in-iife
        "rwl" 'js2r-wrap-in-for-loop
        "k" 'js2r-kill
        "xmj" 'js2r-move-line-down
        "xmk" 'js2r-move-line-up))))

(defun rjsx/init-json-mode ()
  (use-package json-mode
    :defer t))

(defun rjsx/init-json-snatcher ()
  (use-package json-snatcher
    :defer t
    :config
    (spacemacs/set-leader-keys-for-major-mode 'json-mode
      "hp" 'jsons-print-path)))

(defun rjsx/init-tern ()
  (use-package tern
    :defer t
    :init (add-hook 'rjsx-mode-hook 'tern-mode)
    :config
    (progn
      (spacemacs|hide-lighter tern-mode)
      (when rjsx/disable-tern-port-files
        (add-to-list 'tern-command "--no-port-file" 'append))
      (rjsx/set-tern-key-bindings 'rjsx-mode))))

(defun rjsx/init-web-beautify ()
  (use-package web-beautify
    :defer t
    :init
    (progn
      (spacemacs/set-leader-keys-for-major-mode 'rjsx-mode
        "=" 'web-beautify-js)
      (spacemacs/set-leader-keys-for-major-mode 'json-mode
        "=" 'web-beautify-js)
      (spacemacs/set-leader-keys-for-major-mode 'web-mode
        "=" 'web-beautify-html)
      (spacemacs/set-leader-keys-for-major-mode 'css-mode
        "=" 'web-beautify-css))))


(defun rjsx/init-prettier-js ()
  (use-package prettier-js
    :defer t
    :init
    (progn
      (add-hook 'rjsx-mode-hook #'prettier-js-mode)
      (setq prettier-js-args '(
                               "--trailing-comma" "es5"
                               "--bracket-spacing" "false"
                               "--no-semi"
                               "--single-quote")))))
