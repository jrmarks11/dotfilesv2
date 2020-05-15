(setq vc-follow-symlinks t)
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(menu-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)
(line-number-mode +1)
(global-display-line-numbers-mode 1)
(save-place-mode 1)
(global-auto-revert-mode t)

(setq x-select-enable-clipboard t)
(setq ring-bell-function 'ignore)
(setq sentence-end-double-space nil)
(setq inhibit-startup-screen t)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file t)

(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y")

(use-package diminish :ensure t)

(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t))

(show-paren-mode +1)
(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package counsel
  :ensure t)

(use-package ivy
  :ensure t
  :diminish
  :bind
  ("C-s" . swiper)
  ("C-c f" . counsel-fzf)
  :init
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (ivy-mode 1)
  (counsel-mode 1))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)

(setq org-log-done t)
(setq org-startup-indented t)
(setq org-agenda-window-setup 'current-window)
(setq org-directory "~/org")
(setq org-agenda-files (directory-files-recursively "~/org/" "\.org$"))
(setq org-default-notes-file (concat org-directory "/todo/notes.org"))
(add-hook 'org-mode-hook 'turn-on-flyspell)

(defun savebuf(begin end length)
  (if (and (buffer-file-name) (buffer-modified-p))
       (save-buffer)))
(add-hook 'after-change-functions 'savebuf)
