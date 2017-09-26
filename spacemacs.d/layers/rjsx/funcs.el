(defun rjsx/eslintd-set-flycheck-executable ()
  (interactive)
  (when-let (eslintd-executable (executable-find "eslint_d"))
    (make-variable-buffer-local 'flycheck-javascript-eslint-executable)
    (setq flycheck-javascript-eslint-executable eslintd-executable)))

;; Inspired by http://blog.binchen.org/posts/indent-jsx-in-emacs.html
(defun rjsx/js-jsx-indent-line-align-closing-bracket ()
  "Workaround sgml-mode and align closing bracket with opening bracket"
  (save-excursion
    (beginning-of-line)
    (when (looking-at-p "^ +\/?> *$")
      (delete-char sgml-basic-offset))))

(defun rjsx/js-doc-require ()
  "Lazy load js-doc"
  (require 'js-doc))

(defun rjsx/js-doc-set-key-bindings (mode)
  "Setup the key bindings for `js2-doc' for the given MODE."
  (spacemacs/declare-prefix-for-mode mode "mrd" "documentation")
  (spacemacs/set-leader-keys-for-major-mode mode
    "rdb" 'js-doc-insert-file-doc
    "rdf" (if (configuration-layer/package-used-p 'yasnippet)
              'js-doc-insert-function-doc-snippet
            'js-doc-insert-function-doc)
    "rdt" 'js-doc-insert-tag
    "rdh" 'js-doc-describe-tag))

(defun rjsx/js2-refactor-require ()
  "Lazy load js2-refactor"
  (require 'js2-refactor))

(defun rjsx/set-tern-key-bindings (mode)
  "Set the key bindings for tern and the given MODE."
  (add-to-list (intern (format "spacemacs-jump-handlers-%S" mode))
               '(tern-find-definition :async t))
  (spacemacs/set-leader-keys-for-major-mode mode
    "rrV" 'tern-rename-variable
    "hd" 'tern-get-docs
    "gG" 'tern-find-definition-by-name
    (kbd "C-g") 'tern-pop-find-definition
    "ht" 'tern-get-type))

(defun rjsx/tern-detect ()
  "Detect tern binary and warn if not found."
  (let ((found (executable-find "tern")))
    (unless found
      (spacemacs-buffer/warning "tern binary not found!"))
    found))

(defun rjsx/indium-hook ()
  "Lazy load indium, and init indium-interaction-mode."
  (require 'indium)
  (indium-interaction-mode))
