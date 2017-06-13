(defconst editorconfig-packages '(editorconfig))

(defun editorconfig/init-editorconfig ()
  (use-package editorconfig
    :config
    (editorconfig-mode 1)))
