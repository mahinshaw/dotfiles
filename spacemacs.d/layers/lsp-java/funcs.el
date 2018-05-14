(defun spacemacs//java-setup-lsp ()
  "Setup lsp backend."
  (if (configuration-layer/layer-used-p 'lsp)
      (progn
        (require 'lsp-java)
        (lsp-java-enable)
        )
    (message "`lsp' layer is not installed, please add `lsp' layer to your dofile.")))

(defun lsp-action-retrieve-and-run ()
  "Retrieve, select, and run code action."
  (interactive)
  (lsp--cur-workspace-check)
  (lsp--send-request-async (lsp--make-request
                            "textDocument/codeAction"
                            (lsp--text-document-code-action-params))
                           (lambda (actions)
                             (setq lsp-code-actions actions)
                             (condition-case nil
                                 (call-interactively 'lsp-execute-code-action)
                               (quit "Quit")))))
