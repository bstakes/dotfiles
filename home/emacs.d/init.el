(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	     '("elpa"  . "https://elpa.gnu.org/packages"))

;; macOS TLS hack to manually accept certs if there is no .cask file
;; open GUI emacs
;; Always accept certs from melpa and elpa
;; close emacs
;; > cd ~/.emacs.d && cask install
(when
    (and
     (memq window-system '(mac ns x))
     (not (file-exists-p "~/.emacs.d/.cask")))
  (package-refresh-contents))
;;;; Initialize ;;;;

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

(require 'use-package)

;; ui tweaks
(setq inhibit-startup-message t) ; no startup message
(scroll-bar-mode -1)             ; no scroll bars
(tool-bar-mode -1)               ; no toolbar
(column-number-mode t)           ; show column in modeline

;; cursor tweaks
(blink-cursor-mode 0) ; no blinking cursor

;; tabs, spaces, lines, parens
(setq-default indent-tabs-mode nil)            ; Use spaces instead of tabs
(setq tab-width 2)                             ; Length of tab is 4 SPC
(global-linum-mode 1)                          ; show line numbers
(show-paren-mode 1)                            ; highlight matching paren

;; Buffer settings
(setq show-trailing-whitespace t)

;; file settings
(setq create-lockfiles nil)
(setq backup-directory-alist '((".*" . "~/.emacs-backup/"))
      backup-by-copying t)
(setq auto-save-file-name-transforms
      '((".*" "~/.emacs-backup/" t)))

(use-package doom-themes
  :ensure t
  :init (load-theme 'doom-peacock t))

(use-package solaire-mode
  :ensure t
  :init (solaire-mode)
  :config (add-hook 'after-change-major-mode-hook 'turn-on-solaire-mode))

(use-package powerline
  :ensure t)

(use-package airline-themes
  :ensure t
  :init
  (require 'airline-themes)
  (load-theme 'airline-doom-one t))

(use-package evil-leader
  :init (global-evil-leader-mode)
  :config
  (evil-leader/set-leader "-")
  (evil-leader/set-key "gs" 'magit-status))

(use-package evil
  :requires evil-leader
  :ensure t
  :init (evil-mode 1))

(add-hook 'clojure-mode-hook 'prettify-symbols-mode)

(use-package paredit
  :ensure t
  :init
  :init
  (add-hook 'clojure-mode-hook 'enable-paredit-mode)
  (add-hook 'cider-repl-mode-hook 'enable-paredit-mode)
  (add-hook 'lisp-mode-hook 'enable-paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode))

(use-package magit)

(use-package rainbow-delimiters-mode
  :hook (clojure-mode emacs-lisp-mode))

(use-package clojure-mode
  :mode (("\\.edn$" . clojure-mode))
  :config
  (setq clojure-align-forms-automatically t)
  (setq clojure--prettify-symbols-alist
        '(("fn" . ?λ))))

(use-package cider
  :config
  (setq cider-cljs-lein-repl
      "(do (require 'figwheel-sidecar.repl-api)
           (figwheel-sidecar.repl-api/start-figwheel!)
           (figwheel-sidecar.repl-api/cljs-repl))")
  (setq cider-popup-stacktraces-in-repl t)
  (setq cider-auto-select-error-buffer nil)
  (setq cider-repl-use-pretty-printing t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (paredit-mode solaire-mode doom-themes package-build shut-up epl git commander f dash s))))
