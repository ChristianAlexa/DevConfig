;; File: ~/.emacs.d/init.el
;; About: emacs config file
;; Author: Christian Alexa
;; Last update: 01/07/2020

;; package manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)
(package-install 'use-package)
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; use latest package versions
(use-package auto-compile
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (evil auto-compile use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; disable visual bell
(setq ring-bell-function 'ignore)

;; disable menu bar
(menu-bar-mode -1)

;; disable scroll bar
(toggle-scroll-bar -1)

;; disable tool bar
(tool-bar-mode -1)

;; disable startup message
(setq inhibit-startup-screen t)

;; disable tab indentation
(setq-default indent-tabs-mode nil)

;; set scratch buffer message
(setq initial-scratch-message ";; scratch buffer - edit me.")

;; use vim
(use-package evil
  :config
  (evil-mode 1))

;; use company-mode
;; (use-package company)
;; (add-hook 'after-init-hook 'global-company-mode)

;; set backup directory
(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))

;; highlight current line
(global-hl-line-mode)

;; add line numbers
(global-linum-mode t)

;; cycle status (shift + arrow)
(setq org-todo-keywords
  '((sequence "BACKLOG"
     "TODO"
     "IN PROGRESS"
     "IN REVIEW"
     "IN DEV"
     "IN TEST"
     "DEFERRED"
     "DELEGATED"
     "DONE"
     "ARCHIVES")))

;; colorize status
(setq org-todo-keyword-faces
  '(("BACKLOG" . "purple")
    ("TODO" . (:foreground "red" :weight bold))
    ("IN PROGRESS" . "#04AEF9")
    ("IN REVIEW" . (:foreground "#6E7A7F" :weight bold))
    ("IN DEV" . (:foreground "#6E7A7F" :weight bold))
    ("IN TEST" . (:foreground "#6E7A7F" :weight bold))
    ("DEFERRED" . "red")
    ("DELEGATED" . "darkgreen")
    ("DONE" . "darkgreen")
    ("ARCHIVES" . "purple")))

