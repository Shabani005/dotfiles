(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(load-theme 'gruber-darker t)
(require 'package)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

;; Disable the menu bar
(menu-bar-mode -1)

;; Disable the tool bar
(tool-bar-mode -1)

;; Disable the scroll bar
(scroll-bar-mode -1)

;; Add MELPA (biggest package repo) + GNU ELPA
(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

;; Initialize the package system
(package-initialize)			

(use-package evil-nerd-commenter
  :ensure t
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

(use-package undo-fu
  :ensure t
  :bind (("C-/" . undo-fu-only-undo)
         ("C-?" . undo-fu-only-redo)))


(use-package company
  :ensure t
  :init
  (global-company-mode))


;; Refresh package list if needed

(unless package-archive-contents
  (package-refresh-contents))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company d-mode evil-nerd-commenter gruber-darker-theme nasm-mode
	     undo-fu)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
