(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package evil
  :config (evil-mode 1))

(use-package dracula-theme
  :config (load-theme 'dracula t))
