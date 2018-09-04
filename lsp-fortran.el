;;; lsp-fortran.el --- Fortran support for lsp-mode

;; Copyright (C) 2018 Magnus Badel <magnus.leo93@gmail.com>

;; Author: Magnus Badel
;; Version: 0.1.0
;; Package-Requires: ((lsp-mode "3.0"))
;; Keywords: fortran, Fortran, language server
;; URL: https://github.com/MagB93/lsp-fortran

;;; Code:
(require 'lsp-mode)

(defcustom lsp-fortran-command "fortls"
  "Command to invoke the fortran lanuage server: https://github.com/hansec/fortran-language-server"
  :type 'string
  :group 'lsp-fortran
)

(defcustom lsp-fortran-flags
  '("--symbol_skip_mem" "--incremental_sync" "--autocomplete_no_prefix")
  "Extra arguments for the fortran-stdio language server"
  :group 'lsp-fortran
  :risky t
  :type '(repeat-string)
)

(defun lsp-fortran--get-root ()
  "Try to find the language server configuration, refer to https://github.com/hansec/fortran-language-server."
  (lsp-make-traverser #'(lambda (dir)
                          (directory-files
                          dir
                          nil
                          ".fortls")))
)

(defun lsp-fortran--ls-command ()
"Generate the language server startup command."
`(lsp-fortran-command ,@lsp-fortran-flags)
)

(lsp-define-stdio-client lsp-fortran "f90"
                          #'lsp-fortran--get-root nil
                          :command-fn #'lsp-fortran--ls-command)

(provide 'lsp-fortran)
;;; lsp-fortran.el ends here
