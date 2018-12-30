# lsp-fortran

Fortran-support for the [lsp-mode](https://github.com/emacs-lsp/lsp-mode) using the 
[Fortran-Language-Server](https://github.com/hansec/fortran-language-server).

Note that this and the language server itself are still under development

## Installation
### Language-Server
First install [Fortran-Language-Server](https://github.com/hansec/fortran-language-server) via

```bash
sudo pip install fortran-language-server
```

### Emacs

```elisp
(add-to-list 'load-path "<path to lsp-fortran>")
(require 'lsp-fortran)

;; Or with use-package, refer to https://github.com/MagB93/lsp-fortran/issues/1#issuecomment-439398514
(use-package lsp-mode
  :init
  :hook
  (f90-mode . lsp-fortran-enable)
  :config
  (use-package lsp-ui
    :ensure f
    :after flycheck))
(use-package lsp-fortran
  :after lsp-mode)
```

## Configuration

At the moment the following default values are passed to the language server as option
* ``--symbol_skip_mem``
* ``--incremental_sync``
* ``--autocomplete_no_prefix``

To change the arguments you have to modify the value of ``lsp-fortran-flags``. 
For additional options see [Fortran-Language-Server](https://github.com/hansec/fortran-language-server) or 
``fortls --help``.

All issues/ideas/elisp-improvements are welcome! Dont' hesitate to open an issue regarding problems or create a PR.

## Using eglot

It is also possible to use [eglot](https://github.com/joaotavora/eglot) instead of ```lsp-mode```.
Here is the minimal configuration for ```eglot```:

``` elisp
(use-package eglot
  :ensure t
  :config
  (add-to-list 'eglot-server-programs '(f90-mode . ("fortls")))
)
```

Now you just have to call ```M-x eglot``` to activate ```eglot-mode```.
