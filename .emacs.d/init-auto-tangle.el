(use-package org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode))

(setq org-auto-tangle-babel-safelist '(
                                     "~/dotfiles/new-setup/additional-packages.org"
                                     "~/dotfiles/new-setup/new-setup-all-systems.org"
                                     ))
