(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package general)

(defmacro after! (pkg &rest body)
  "Like with-eval-after-load, but shorter and pkg does not need parenthesis"
  `(with-eval-after-load ,(symbol-name pkg) ,@body))

(defmacro general-config! (pkg &rest body)
  "Equivalent to (after! pkg (general-def body))"
  `(after! pkg (general-def ,@body)))

(defmacro hook! (hook fn)
  "Like add-hook, but hook does not need to be quoted and has -hook appended"
  (let ((hook-name (intern (concat (symbol-name hook) "-hook"))))
    `(add-hook ',hook-name ,fn)))

(setq evil-want-C-u-delete t
      evil-want-C-u-scroll t)

(setq evil-want-Y-yank-to-eol t)

(setq evil-want-fine-undo t)

(setq evil-want-minibuffer t)

(setq evil-want-keybinding nil)

(use-package evil :config (evil-mode))

(use-package evil-collection
  :custom (evil-collection-setup-minibuffer t)
  :config (evil-collection-init))

(use-package evil-surround
  :config (global-evil-surround-mode))

(general-config! evil-surround :states 'visual
		"s" #'evil-surround-region
		"S" #'evil-Surround-region)

(use-package evil-commentary :config (evil-commentary-mode))

(use-package evil-matchit :config (global-evil-matchit-mode))

(use-package evil-exchange :config (evil-exchange-install))

(use-package evil-args
  :general
  (:keymaps 'evil-inner-text-objects-map "a" #'evil-inner-arg)
  (:keymaps 'evil-outer-text-objects-map "a" #'evil-outer-arg)
  (:states '(normal motion)
	   "L" #'evil-forward-arg
	   "H" #'evil-backward-arg))

(use-package evil-visualstar :config (global-evil-visualstar-mode))

(use-package evil-snipe :config (evil-snipe-mode))

(setq evil-snipe-repeat-keys nil)

(use-package god-mode
  :general
  ("S-SPC" #'god-execute-with-current-bindings)
  (:states '(normal visual) "SPC" #'god-execute-with-current-bindings)
  :general-config
  (:keymaps 'god-local-mode-map "C-u" #'universal-argument))

(use-package dracula-theme
  :config (load-theme 'dracula t))

(use-package dashboard :config (dashboard-setup-startup-hook))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq native-comp-async-report-warnings-errors 'silent)

(setq fill-column 80)

(setq help-window-select t)

(save-place-mode)

(setq inhibit-startup-message t)

(use-package org-auto-tangle :ghook 'org-mode-hook)

(hook! emacs-startup #'toggle-frame-maximized)
