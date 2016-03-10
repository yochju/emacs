(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c9fa45acd59564778b031178375261dbdc9259c9781c86e64c937ded3d8132e7"
     "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa"
     "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223"
     "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(global-linum-mode t)
 '(linum-format "%d ")
 '(linum-highlight-in-all-buffersp nil)
 '(rm-blacklist
   (quote
    (" hl-p" " SP" " AC" " Abbrev" " HelmGtags" " FA" " hs" " Helm" " wb" " WK" " yas" " company"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ediff-even-diff-Ancestor ((t (:background "Grey" :foreground "black"))))
 '(ediff-even-diff-B ((t (:background "Grey" :foreground "black"))))
 '(ediff-fine-diff-A ((t (:background "red" :foreground "black"))))
 '(ediff-fine-diff-B ((t (:background "green" :foreground "black"))))
 '(ediff-fine-diff-C ((t (:background "yellow" :foreground "black"))))
 '(ediff-odd-diff-A ((t (:background "Grey" :foreground "black"))))
 '(ediff-odd-diff-C ((t (:background "Grey" :foreground "black"))))
 '(linum-highlight-face ((t (:inherit default :background "color-235" :foreground "brightred"))))
 '(mode-line ((t (:background "color-235" :inverse-video nil))))
 '(mode-line-inactive ((t (:background "color-235" :inverse-video nil))))
 '(region ((t (:background "brightblack")))))


;; no menu or welcome
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-message t)

;; package.el
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
    (package-initialize))

;; custom theme
(load-theme 'seshu)

;; window switching
(global-set-key (kbd "C-c l") 'windmove-left)
(global-set-key (kbd "C-c r") 'windmove-right)
(global-set-key (kbd "C-c u") 'windmove-up)
(global-set-key (kbd "C-c d") 'windmove-down)

;; window number
(require 'window-number)
(window-number-mode 1)
(window-number-meta-mode 1)

;; hlinum
(require 'hlinum)
(hlinum-activate)
(setq linum-format "%d ")
(global-linum-mode 1)

;; lua
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;; gdb
(setq gdb-many-windows t
      gdb-show-main t)

;; sml
(setq sml/theme 'respectful)
(sml/setup)

;; cuda
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))

;; rtags
(require 'rtags)
(require 'company-rtags)

(rtags-enable-standard-keybindings c-mode-base-map)
(setq rtags-completions-enabled t)

;; python
;; (add-hook 'python-mode-hook 'anaconda-mode)
;; (add-hook 'python-mode-hook 'ac-anaconda-setup)

;; lua
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;; gdb
(setq gdb-many-windows t
      gdb-show-main t)

;; sml
(setq sml/theme 'respectful)
(sml/setup)

;; cuda
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))

;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-rtags company-irony-c-headers company-irony)))

(add-hook 'c++-mode-hook 'my:ac-c-headers-init)
(add-hook 'c-mode-hook 'my:ac-c-headers-init)

;; semantic mode
(semantic-mode 1)
(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic))
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
(global-semantic-idle-scheduler-mode 1)

;; whitespace
;; (global-set-key (kbd "C-c w") 'whitespace-mode)
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; clean-aindent
(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;; smartparens
(require 'smartparens-config)
(show-smartparens-global-mode +1)
(smartparens-global-mode 1)

;; when you press RET, the curly braces automatically
;; add another newline
(sp-with-modes '(c-mode c++-mode)
  (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair "/*" "*/" :post-handlers '((" | " "SPC")
                                            ("* ||\n[i]" "RET"))))

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; speedbar
(require 'sr-speedbar)
(global-set-key (kbd "C-c s") 'sr-speedbar-toggle)

;; hs-minor-mode
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)

;; stickyfunc-enhance
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(require 'stickyfunc-enhance)
(global-semantic-stickyfunc-mode)

;; dtrt-indent
(require 'dtrt-indent)
(dtrt-indent-mode 1)
(setq dtrt-indent-verbosity 0)

;; ws-butler
(require 'ws-butler)
;; (add-hook 'c-mode-common-hook 'ws-butler-mode)
(ws-butler-global-mode)

;; which-key
(require 'which-key)
(which-key-mode)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; layout restore
;; (add-to-list 'load-path "~/.emacs.d/layout-restore")
;; (require 'layout-restore)
;; (global-set-key (kbd "C-c w s") 'layout-save-current)
;; (global-set-key (kbd "C-c w r") 'layout-restore)
;; (global-set-key (kbd "C-c w k") 'layout-delete-current)

;; gc-cons
(defun my-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  (setq gc-cons-threshold 800000))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)
