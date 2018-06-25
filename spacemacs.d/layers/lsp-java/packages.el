;;; packages.el --- lsp-java layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Mark Hinshaw <mhinshaw@mhinshaw-mac.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `lsp-java-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `lsp-java/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `lsp-java/pre-init-PACKAGE' and/or
;;   `lsp-java/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:


(defconst lsp-java-packages
  '(
    company
    flycheck
    (lsp-java
     ;; :location local
     :requires lsp-mode)
    (google-java-format
     :location local)
    )
  "The list of Lisp packages required by the lsp-java layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun lsp-java/init-lsp-java ()
  (use-package lsp-java
    :defer t
    :init (progn
            (spacemacs/add-to-hook 'java-mode-hook
                                   '(spacemacs//java-setup-lsp))
            (require 'lsp-imenu)
            (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)

            (spacemacs/declare-prefix-for-mode 'java-mode "mg" "goto")
            (spacemacs/declare-prefix-for-mode 'java-mode "mh" "documentation")
            (spacemacs/declare-prefix-for-mode 'java-mode "mr" "refactor")
            (spacemacs/declare-prefix-for-mode 'java-mode "mre" "extract")
            (spacemacs/declare-prefix-for-mode 'java-mode "ms" "server")
            (spacemacs/declare-prefix-for-mode 'java-mode "mu" "lsp-ui")

            (spacemacs/set-leader-keys-for-major-mode 'java-mode
              ;; "gg" 'xref-find-definitions
              "="  'google-java-format-buffer
              ;; "as" 'lsp-action-retrieve-and-run
              "as" 'lsp-ui-sideline-apply-code-actions
              "aa" 'lsp-execute-code-action
              "an" 'lsp-java-actionable-notifications

              "bp" 'lsp-java-build-project
              "bu" 'lsp-java-update-project-configuration
              "bU" 'lsp-java-update-user-settings

              "gG" 'xref-find-definitions-other-window
              "gi" 'helm-imenu
              "gr" 'xref-find-references

              "ha" 'xref-find-apropos
              "hh" 'lsp-describe-thing-at-point

              "rec" 'lsp-java-extract-to-constant
              "rel" 'lsp-java-extract-to-local-variable
              "rem" 'lsp-java-extract-method

              "rf" 'lsp-java-create-field
              "rl" 'lsp-java-create-local
              "ri" 'lsp-java-add-import
              "rI" 'lsp-java-organize-imports
              "rn" 'lsp-rename
              "rp" 'lsp-java-create-parameter

              "sr" 'lsp-restart-workspace

              "ug" 'lsp-ui-peek-find-definitions
              "ui" 'lsp-ui-peek-find-implementation
              "ui" 'lsp-ui-imenu
              "ur" 'lsp-ui-peek-find-references
              )
            (add-to-list 'spacemacs-jump-handlers-java-mode 'xref-find-definitions)
            ;; (defadvice xref-find-definitions (before add-evil-jump activate) (evil-set-jump))
            )
    :commands lsp-java-enable
    ))

(defun lsp-java/post-init-company ()
  (spacemacs|add-company-backends
    :backends company-lsp
    :modes java-mode
    :variables company-tooltip-align-annotations t)
  (setq company-quickhelp-delay nil))

(defun lsp-java/post-init-flycheck ()
  (spacemacs/enable-flycheck 'java-mode))

(defun lsp-java/init-google-java-format ()
  (use-package google-java-format
    :init (progn
            (add-hook 'java-mode-hook
                      (lambda ()
                        (add-hook 'before-save-hook #'google-java-format-buffer nil 'local))))
    :config (progn
              (setq google-java-format-executable (executable-find "google-java-format")))))
;;; packages.el ends here
