;;; buf1024's fucking .emacs file
;;; Luo Guochun
;;; 1 September 2016

;;; package 仓库
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa.milkbox" . "http://melpa.milkbox.net/packages/"))

(package-initialize)

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; exec-path-from-shell 将shell环境变量复制过来
(setq exec-path-from-shell-check-startup-files nil)
(exec-path-from-shell-initialize)
(exec-path-from-shell-copy-env "GOROOT")
(exec-path-from-shell-copy-env "GOPATH")

;;; emacs-ycmd
(add-hook 'after-init-hook #'global-company-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'ycmd)
(add-hook 'after-init-hook #'global-ycmd-mode)
(set-variable 'ycmd-server-command '("python" "/home/heidong/privt/proj/ycmd/ycmd"))
(set-variable 'ycmd-global-config "/home/heidong/.ycm_extra_conf.py")

(require 'company-ycmd)
(company-ycmd-setup)

(require 'flycheck-ycmd)
(flycheck-ycmd-setup)

(when (not (display-graphic-p))
  (setq flycheck-indication-mode nil))

;;; org-mode
(add-hook 'org-mode-hook (lambda()
                           (setq org-startup-indented t
                                 truncate-lines nil)))


;;; 行号
(global-linum-mode t)
(column-number-mode t)
(setq line-number-mode t)
(setq column-number-mode t)

;;; 缩进
(setq indent-tabs-mode t)
(setq default-tab-width 4)
(setq tab-width 4)
(setq auto-indent-assign-indent-level 4)
;;; 其他杂项
;;关闭emacs启动时的画面
(setq inhibit-startup-message t)
;;关闭gnus启动时的画面
(setq gnus-inhibit-startup-message t)
;;; y/n -> yes / no
(fset 'yes-or-no-p 'y-or-n-p)
;;打开括号匹配显示模式
(show-paren-mode t)
;;括号匹配时可以高亮显示另外一边的括号，但光标不会烦人的跳到另一个括号处
(setq show-paren-style 'parenthesis)
;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; C-SPC冲突，重新绑定
(global-set-key (kbd "M-SPC") 'set-mark-command)
;; 自动换行
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#eaeaea" "#d54e53" "#b9ca4a" "#e7c547" "#7aa6da" "#c397d8" "#70c0b1" "#000000"))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
	("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(fci-rule-color "#424242")
 '(truncate-partial-width-windows nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
	((20 . "#d54e53")
	 (40 . "#e78c45")
	 (60 . "#e7c547")
	 (80 . "#b9ca4a")
	 (100 . "#70c0b1")
	 (120 . "#7aa6da")
	 (140 . "#c397d8")
	 (160 . "#d54e53")
	 (180 . "#e78c45")
	 (200 . "#e7c547")
	 (220 . "#b9ca4a")
	 (240 . "#70c0b1")
	 (260 . "#7aa6da")
	 (280 . "#c397d8")
	 (300 . "#d54e53")
	 (320 . "#e78c45")
	 (340 . "#e7c547")
	 (360 . "#b9ca4a"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(tool-bar-mode -1)
;; (menu-bar-mode -1)

;; 全局打开列编辑模式
(cua-mode 1)
;; 全局打开semantic 模式
(require 'semantic)
(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(semantic-mode 1)

;; company 
(require 'company)
(global-company-mode)

;; company quick help
(company-quickhelp-mode 1)

;; go 语言
(require 'company-go)
(require 'go-mode-autoloads)
(add-hook 'go-mode-hook (lambda()
						  (add-to-list 'company-backends 'company-go)))
(add-hook 'before-save-hook 'gofmt-before-save)

;;;
;(require 'evil)
;(evil-mode 1)

(setq default-directory "/home/heidong/")




;;; sr-speedbar
(require 'sr-speedbar)
(setq speedbar-show-unknown-files t)
(setq sr-speedbar-width-x 25)
(setq sr-speedbar-width-console 25)
(setq sr-speedbar-auto-refresh t)
(setq sr-speedbar-right-side nil)
(global-set-key (kbd "<f7>") 'sr-speedbar-toggle)

;;; helm
(add-to-list 'load-path "/home/heidong/.emacs.d/my/emacs-async")
(add-to-list 'load-path "/home/heidong/.emacs.d/my/helm")
(setq tramp-ssh-controlmaster-options "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
(require 'helm)
(require 'helm-config)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x c o") 'helm-occur)
(global-set-key (kbd "C-x c SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-x c x") 'helm-register)
(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)
(helm-autoresize-mode t)
(setq helm-split-window-in-side-p t
	  helm-move-to-line-cycle-in-source t
	  helm-ff-search-library-in-sexp t
	  helm-ff-file-name-history-use-recentf t
	  helm-M-x-fuzzy-match t
	  helm-buffers-fuzzy-matching t
	  helm-recentf-fuzzy-match t
	  helm-semantic-fuzzy-match t
	  helm-imenu-fuzzy-match t
	  helm-locate-fuzzy-match t
	  helm-apropos-fuzzy-match t)
(helm-mode 1)

;;; projctile
(projectile-global-mode)
(setq projectile-completion-system 'helm
	  projectile-enable-caching  t)
(helm-projectile-on)


;; ggtags
(add-hook 'c-mode-common-hook
		  (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
			  (ggtags-mode 1))))

;; themes
(load-theme 'dracula t)
;; (load-theme 'zenburn t)
;; (load-theme 'solarized-dark t)
;; (require 'color-theme-sanityinc-tomorrow)
;; M-x color-theme-sanityinc-tomorrow-day
;; M-x color-theme-sanityinc-tomorrow-night
;; M-x color-theme-sanityinc-tomorrow-blue
;; M-x color-theme-sanityinc-tomorrow-bright
;; M-x color-theme-sanityinc-tomorrow-eighties

;; 实现全屏效果，快捷键为f11
(global-set-key [f11] 'my-fullscreen) 
(defun my-fullscreen ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0)))


;; 最大化
(defun my-maximized ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))

;; 启动emacs时窗口最大化
(my-maximized)
