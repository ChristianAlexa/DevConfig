;; Emacs Config File: ~/.emacs.d/init.el

;; package manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; emacs auto config - refrain from modifying this
(custom-set-variables
 '(package-selected-packages (quote (evil use-package))))
(custom-set-faces)

;; disable visual bell warning
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

;; disable backup files (danger is my middle name)
(setq make-backup-files nil)

;; set solarized light color theme
(add-to-list 'default-frame-alist '(background-color . "#eee8d5"))
(add-to-list 'default-frame-alist '(foreground-color . "#002b36"))

;; set scratch buffer message
(setq initial-scratch-message ";; scratch buffer - edit me.")

;; use vim
(use-package evil
  :config
  (evil-mode 1))

;; set backup directory
(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))

;; highlight current line
(global-hl-line-mode)

;; add line numbers
(global-linum-mode t)

;; hides blank lines between headings which keeps folded view compact
(setq org-cycle-separator-lines 0)

;; style org mode bullets
(use-package org-bullets
    :hook (org-mode . org-bullets-mode))

;; cycle status (shift + arrow)
(setq org-todo-keywords
  '((sequence "BACKLOG"
     "TODO"
     "IN PROGRESS"
     "IN REVIEW"
     "IN DEV"
     "IN TEST"
     "DELEGATED"
     "DONE")))

;; add color to status
(setq org-todo-keyword-faces
  '(("BACKLOG" . "purple")
    ("TODO" . "red")
    ("IN PROGRESS" . "blue")
    ("IN REVIEW" . "orange")
    ("IN DEV" . "gray")
    ("IN TEST" . "gray")
    ("DELEGATED" . "gray")
    ("DONE" . "dark green")))
