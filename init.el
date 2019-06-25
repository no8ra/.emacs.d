;; Ricty フォントの利用
;; (create-fontset-from-ascii-font "Ricty-14:weight=normal:slant=normal" nil "ricty")
;; (set-fontset-font "fontset-ricty"
;;                   'unicode
;;                   (font-spec :family "Ricty" :size 14)
;;                   nil
;;                   'append)
(add-to-list 'default-frame-alist '(font . "ricty-14"))
(setq inhibit-startup-screen t)
(set-locale-environment nil)
(prefer-coding-system 'utf-8)
(show-paren-mode t)
(setq scroll-conservatively 1)
(global-auto-revert-mode 1)
(put 'set-goal-column 'disabled nil)
(column-number-mode t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(set-scroll-bar-mode nil)
(fset 'yes-or-no-p 'y-or-n-p)
(setq default-tab-width 4)
(setq ring-bell-function 'ignore)
;; linum format
(setq linum-format " %d ")
;;; customization
(setq custom-file (locate-user-emacs-file "custom.el"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; serverstart for emacs-client
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'server)
(unless (server-running-p)
  (server-start))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("melpa" . "http://melpa.org/packages/")
  	("org" . "http://orgmode.org/elpa/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
;;;;; ensure to use use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; copy and paste
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))
(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; bind key
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package bind-key
  :ensure t)
(bind-keys
 ("C-h" . delete-backward-char)
 ("s-f" . toggle-frame-fullscreen))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; mode line
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package smart-mode-line
  :ensure t
  :hook (after-init . sml/setup))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; company mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package company
  :ensure t
  :bind
  (("C-x C-@" . company-mode))
  :config
  (global-company-mode +1)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3)
  (setq company-selection-wrap-around t)
  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t)
  (setq company-require-match nil)

  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-h") nil)
  ;; C-n, C-pで補完候補を次/前の候補を選択
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  (define-key company-search-map (kbd "C-p") 'company-select-previous)
  ;; C-sで絞り込む
  (define-key company-active-map (kbd "C-s") 'company-filter-candidates)
  (define-key company-active-map (kbd "C-i") 'company-complete-selection)
  (define-key company-active-map [tab] 'company-complete))

(use-package company-quickhelp
  :ensure t
  :config
  (company-quickhelp-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; auto insert
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package autoinsert
  :ensure t
  :config
  (add-hook 'find-file-hooks 'auto-insert))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; anzu
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package anzu
  :ensure t
  :config
  (global-anzu-mode +1))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; smartparens
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package smartparens
  :ensure t
  :config
  (bind-keys
   :map smartparens-mode-map
   ("M-l" . sp-forward-barf-sexp)
   ("M-h" . sp-backward-barf-sexp)
   ("M-j" . sp-backward-slurp-sexp)
   ("M-k" . sp-forward-slurp-sexp)

   ("M-u" . sp-splice-sexp-killing-backward)
					; ("M-i" . sp-splice-sexp-killing-forward)
   ("C-M-<backspace>"   . sp-backward-kill-sexp)
   ("C-M-a" . sp-beginning-of-sexp)
   ("C-M-e" . sp-end-of-sexp)
   ("C-M-f" . sp-forward-sexp)
   ("C-M-b" . sp-backward-sexp)
   ("C-M-n" . sp-next-sexp)
   ("C-M-p" . sp-previous-sexp))
  (smartparens-global-mode)
  (add-hook 'lisp-mode-hook  'turn-off-smartparens-mode)
  (add-hook 'emacs-lisp-mode-hook 'turn-off-smartparens-mode)
  (add-hook 'clojure-mode-hook 'turn-off-smartparens-mode)
  (add-hook 'cider-repl-mode-hook 'turn-off-smartparens-mode)
  (add-hook 'slime-mode-hook 'turn-off-smartparens-mode)
  (add-hook 'slime-repl-mode-hook 'turn-off-smartparens-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; paredit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package paredit
  :ensure t
  :bind
  (:map paredit-mode-map
	("M-l" . paredit-forward-barf-sexp)
	("M-h" . paredit-backward-barf-sexp)
	("M-j" . paredit-backward-slurp-sexp)
	("M-k" . paredit-forward-slurp-sexp)
	("M-u" . paredit-splice-sexp-killing-backward)
					;   ("M-i" . paredit-splice-sexp-killing-forward)
	("C-h" . paredit-backward-delete)
	("C-M-f" . paredit-forward)
	("C-M-b" . paredit-backward))
  :hook ((emacs-lisp-mode . enable-paredit-mode)
	 (lisp-interacton-mode . enable-paredit-mode)
	 (slime-mode . enable-paredit-mode)
	 (slime-repl-mode . enable-paredit-mode)
	 (clojure-mode . enable-paredit-mode)
	 (cider-repl-mode . enable-paredit-mode)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; helm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package helm
  :ensure t
  :init
  (require 'helm-config)
  (setq helm-ff-file-name-history-use-recentf t)
  (setq helm-display-function #'display-buffer)
  :bind
  (("M-x" . helm-M-x)
   ("C-x C-f" . helm-find-files)
   ("C-x C-r" . helm-recentf)
   ("M-y"     . helm-show-kill-ring)
   ("C-c i"   . helm-imenu)
   ("C-x b"   . helm-buffers-list)
   ("M-r"     . helm-resume)
   ("C-M-h"   . helm-apropos)
   :map helm-map
   ("C-h" . delete-backward-char)
   ("TAB" . helm-execute-persistent-action)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; YASNIPPET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ESHELL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq eshell-prompt-function
      (lambda nil
	(concat "[ "
		(format-time-string "%Y/%m/%d %H:%M")
		" | "
		(user-login-name)
		"@"
		(system-name)
		" ]
" "["
		(abbreviate-file-name
		 (eshell/pwd))
		"]
"
		(if
		    (=
		     (user-uid)
		     0)
		    "#" "$")
		" ")))
(setq eshell-prompt-regexp "^\\(\\[[^]
]+\\]\\|[$#] \\)")
;; 追加設定
(defcustom eshell-prompt-regexp-lastline "^[#$] "
  "複数行プロンプトの最終行にマッチする正規表現を指定する"
  :type 'regexp
  :group 'eshell-prompt)

;; 複数行プロンプトでもスキップが正常に動作するようにする
(defadvice eshell-skip-prompt (around eshell-skip-prompt-ext activate)
  (if (looking-at eshell-prompt-regexp)
      (re-search-forward eshell-prompt-regexp-lastline nil t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; OTHER WINDOW
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))
(defun other-window-or-split-1 ()
  (interactive)
  (when (one-window-p)
    (split-window-vertically))
  (other-window -1))
(global-set-key (kbd "s-[") 'other-window-or-split)
(global-set-key (kbd "s-]") 'other-window-or-split-1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; WINDOW RESIZE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        c)
    (catch 'end-flag
      (while t
        (message "size[%dx%d]"
                 (window-width) (window-height))
        (setq c (read-char))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (message "Quit")
               (throw 'end-flag t)))))))
(bind-key "\C-q" 'window-resizer)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; QuickRun
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package quickrun
  :ensure t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; FLYCHECK
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(with-eval-after-load 'flymake
  (custom-set-variables
   '(flymake-error-bitmap nil)
   '(flymake-note-bitmap nil)
   '(flymake-warning-bitmap nil)
   )
  (set-face-underline 'flymake-error nil)
  (set-face-underline 'flymake-note nil)
  (set-face-underline 'flymake-warning nil)
  )
(use-package flycheck-pos-tip
  :ensure t)
(use-package flycheck
  :ensure t
  :config
  (flycheck-pos-tip-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Language Server
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package lsp-mode
  :ensure t)
(use-package lsp-ui
  :ensure t
  :config
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-use-childframe t)
  (setq lsp-ui-doc-position 'at-point)
  (setq lsp-ui-doc-use-webkit t)
  (setq lsp-ui-doc-header nil)
  :preface
  (defun toggle-lsp-ui-doc ()
    (interactive)
    (if lsp-ui-doc-mode
        (progn
          (lsp-ui-doc-mode -1)
          (lsp-ui-doc--hide-frame)
	  (message "Lsp-Ui-Doc mode disabled in current buffer"))
      (progn (lsp-ui-doc-mode 1)
	     (message "Lsp-Ui-Doc mode enabled in current buffer"))))
  :bind
  (:map lsp-mode-map
	("C-c d" . toggle-lsp-ui-doc)))
(use-package company-lsp
  :ensure t
  :commands company-lsp)
(use-package helm-lsp
  :ensure t
  :commands helm-lsp-workspace-symbol)
(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; LISP (SLIME)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package slime
  :ensure t
  :config
  (slime-setup '(slime-repl slime-fancy slime-banner))
  (setq inferior-lisp-program "sbcl"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; SCHEME
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar my-paredit-paren-prefix-pat-chicken
  (mapconcat
   #'identity
   '(
     "#"
     "#[suf]\\(8\\|16\\|32\\|64\\)"     ; SRFI-4
     "#[0-9]+="                         ; SRFI-38
     "#u8"				; R6RS bytevector
     )
   "\\|"))
(defvar my-paredit-dquote-prefix-pat-chicken
  (mapconcat
   #'identity
   '(
     "#"
     )
   "\\|"))
(defun paredit-space-for-delimiter-p-chicken (endp delimiter)
  (or endp
      (cond ((= (char-syntax delimiter) ?\()
	     (not (looking-back my-paredit-paren-prefix-pat-chicken)))
	    ((= (char-syntax delimiter) ?\")
	     (not (looking-back my-paredit-dquote-prefix-pat-chicken))))))

(defun my-scheme-hook ()
  (set (make-variable-buffer-local
	'paredit-space-for-delimiter-predicates)
       (list #'paredit-space-for-delimiter-p-chicken))
  (enable-paredit-mode)
  (turn-off-smartparens-mode)
  (set (make-local-variable 'indent-tabs-mode) nil))

(autoload 'scheme-mode "cmuscheme" "Marjor mode for Scheme." t)
(require 'cmuscheme)
(add-hook 'scheme-mode-hook
	  (lambda ()
	    (my-scheme-hook)))
(setq auto-insert-alist
      '(("\\.scm" .
         (insert "#!/bin/sh\n#| -*- scheme -*-\nexec csi -s $0 \"$@\"\n|#\n"))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; GEISER
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; $ chicken-install -s apropos chicken-doc srfi-18 srfi-1
;; $ cd `csi -R chicken.platform -p '(chicken-home)'`
;; $ curl https://3e8.org/pub/chicken-doc/chicken-doc-repo-5.tgz | sudo tar zx
(use-package geiser
  :ensure t
  :bind
  (("C-c s" . run-geiser))
  :init
  (setq geiser-active-implementations '(chicken))
  (add-hook 'geiser-repl-mode-hook
	    (lambda ()
	      (my-scheme-hook))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; R (ESS)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-ess-hook ()
  (setq ess-indent-level 2)
  (setq ess-indent-offset 2)
  (smartparens-mode t)
  (ess-set-style 'RStudio- 'quiet))
(use-package ess
  :ensure t
  :init
  (require 'ess-site)
  :config
  (add-hook 'R-mode-hook
	    (lambda ()
	      (my-ess-hook)))
  (add-hook 'inferior-ess-mode-hook
	    (lambda ()
	      (my-ess-hook)))
  (define-key ess-r-mode-map "_" #'ess-insert-assign))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Markdown
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package markdown-mode
  :ensure t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Rmarkdown
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package poly-R
  :ensure t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Julia
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package julia-mode
  :ensure t
  :config
  (add-hook 'julia-mode
	    (lambda ()
	      (setq julia-indent-offset 4)
	      (ess-julia-mode)))
  (add-to-list 'ess-tracebug-search-path
	       "/Applications/Julia-0.6.app/Contents/Resources/julia/share/julia/base"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; RUBY
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'ruby-mode-hook 'eglot-ensure)
(use-package inf-ruby
  :ensure t)
(use-package ruby-end
  :ensure t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; GFORTH
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (autoload 'forth-mode "gforth.el")
;; (setq auto-mode-alist (cons '("\\.fs\\'" . forth-mode)
;; 			    auto-mode-alist))
;; (autoload 'forth-block-mode "gforth.el")
;; (setq auto-mode-alist (cons '("\\.fb\\'" . forth-block-mode)
;; 			    auto-mode-alist))

;; (add-hook 'forth-mode-hook
;; 	  (lambda ()
;; 	    (setq forth-indent-level 4)
;; 	    (setq forth-minor-indent-level 2)
;; 	    (setq forth-hilight-level 3)
;; 	    (bind-key "C-<return>" 'forth-send-paragraph forth-mode-map)
;; 	    (bind-key "C-c C-b" 'forth-send-buffer forth-mode-map)
;; 	    (unbind-key "C-h" forth-mode-map)
;; 					;(run-forth)
;; 	    (cua-mode -1)
;; 	    ))

;; (add-hook 'inferior-forth-mode-hook
;; 	  (lambda ()
;; 	    (unbind-key "C-c C-z" inferior-forth-mode-map)
;; 	    (bind-key "C-c C-z" 'forth-switch-to-interactive inferior-forth-mode-map)))
(use-package forth-mode
  :ensure t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; GIT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; nginx
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package nginx-mode
  :ensure t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; web-mode emmet-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package web-mode
  :ensure t
  :config
  (add-hook 'web-mode-hook
	    (lambda ()
	      (emmet-mode)
	      (sgml-electric-tag-pair-mode t)
	      (setq web-mode-markup-indent-offset 2)
	      (setq web-mode-css-indent-offset 2)
	      (setq web-mode-code-indent-offset 2)
	      ))
  (sp-with-modes '(web-mode)
    (sp-local-pair "<" ">")
    (sp-local-pair "<%" "%>")))
(use-package emmet-mode
  :ensure t
  :hook (sgml-mode css-mode)
  :config
  (add-hook 'emmet-mode-hook
	    (lambda ()
	      (setq emmet-indentation 2))))

(add-hook 'css-mode-hook
	  (lambda ()
	    (setq css-indent-offset 2)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; HTML, CSS, SCSS, HAML, yaml
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package yaml-mode
  :ensure t)
(use-package scss-mode
  :ensure t)
(add-hook 'html-mode-hook
	  (lambda ()
	    (sgml-electric-tag-pair-mode t)
	    (set (make-local-variable 'sgml-basic-offset) 2)
	    ))
(defun my-css-comment ()
  (interactive)
  (let* ((str (read-string "comment-tag> "))
	 (bar (concat " " (make-string (- 50 (length str)) ?\-) " ")))
    (insert (concat "/* " str bar "*/\n\n"))
    (insert (concat "/*" bar str " */\n"))
    (previous-line 2)))
(add-hook 'css-mode-hook
	  (lambda ()
	    (define-key css-mode-map "\C-c\C-c" 'my-css-comment)
	    (set (make-local-variable 'css-indent-offset) 2)
	    ))

(add-hook 'scss-mode-hook
	  '(lambda ()
	     (set (make-local-variable 'css-indent-offset) 2)
	     (set (make-local-variable 'scss-compile-at-save) nil)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; PHP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package php-mode
  :ensure t)
(add-hook 'php-mode-hook
	  (lambda ()
	    (c-set-offset 'case-label' 2)
	    (c-set-offset 'arglist-intro' 2)
	    (c-set-offset 'arglist-cont-nonempty' 2)
	    (setq c-basic-offset 2)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; JavaScript
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-js-hook ()
  (setq js2-basic-offset 2)
  (setq js2-strict-missing-semi-warning nil)
  (set (make-local-variable 'indent-tabs-mode) nil)
  (add-to-list 'write-file-functions 'delete-trailing-whitespace)
  (add-hook 'after-save-hook 'eslint-fix nil t))
(use-package js2-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

  (add-hook 'js2-mode-hook
	    (lambda ()
	      (my-js-hook)
	      (lsp))))
(add-hook 'js-mode-hook
	  (lambda ()
	    (my-js-hook)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Vue
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package vue-mode
  :ensure t
  :config
  (add-hook 'vue-mode-hook
	    (lambda ()
	      (setq vue-html-extra-indent js2-basic-offset)
	      (set (make-local-variable 'css-indent-offset) 2)
	      (add-to-list 'write-file-functions 'delete-trailing-whitespace)
	      (add-hook 'before-save-hook 'lsp-format-buffer)
	      (lsp))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; VueTypeScript
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package tide
  :ensure t)
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1))


;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(use-package typescript-mode
  :ensure t)
(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;; enable typescript-tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)

(defun tslint-fix-file ()
  "Tslint fix file."
  (interactive)
  (message (concat "tslint --fixing the file " (buffer-file-name)))
  (shell-command (concat "tslint --fix " (buffer-file-name))))

(defun tslint-fix-file-and-revert ()

  "Format the current file with TSLint."
  (interactive)
  (when (string-equal "tsx" (file-name-extension buffer-file-name))
    (if (executable-find "tslint")
	(tslint-fix-file)
      (message "TSLint not found."))))

;; formats the buffer after saving
(add-hook 'after-save-hook 'tslint-fix-file-and-revert)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; C/C++
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-c-hook ()
  (flycheck-mode +1)
  (lsp)
  (add-hook 'before-save-hook 'lsp-format-buffer))
(add-hook 'c-mode-common-hook 'my-c-hook)
(bind-key "C-c C-c" 'quickrun c-mode-map)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Go
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package go-mode
  :ensure t
  :commands go-mode
  :init
  (add-hook 'go-mode-hook
	    (lambda ()
	      (set (make-local-variable 'indent-tabs-mode) t)
	      (setq tab-width 4)
	      (flymake-mode -1)
	      (lsp)))
  :config
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  :bind (:map go-mode-map
	      ("C-?" . godoc-at-point)
	      ("C-c C-c" . quickrun)))

(use-package go-snippets
  :ensure t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TOML
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package toml-mode
  :ensure t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ORG-MODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package org
  :ensure t)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-catch-invisible-edits t)
(defun org-html-open ()
  (interactive)
  (let ((filename (org-html-export-to-html)))
    (browse-url-of-file filename)))
(bind-key "C-c C-v" 'org-html-open org-mode-map)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot . t)))
(require 'ox-latex)
(setq org-latex-pdf-process
      '("platex %f"
	"platex %f"
	"bibtex %b"
	"platex %f"
	"platex %f"
	"dvipdfmx %b.dvi"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Graphviz
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package graphviz-dot-mode
  :ensure t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; J APL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (package-install 'j-mode)
(use-package j-mode
  :ensure t)
(setq auto-mode-alist
      (cons '("\\.ij[rstp]" . j-mode) auto-mode-alist))
(setq j-console-cmd "jc")
(setq j-help-local-dictionary-url "file:///Users/yagi/j64-804/addons/docs/help/dictionary/")

(defun j-console-send-region ( start end )
  "Sends current region to the j-console-cmd session and exectues it"
  (interactive "r")
  (when (= start end)
    (error "Region is empty"))
  (let ((region (buffer-substring-no-properties start end))
	(session (j-console-ensure-session)))
    (comint-send-string session (format "\n%s\n" region))))

(defun j-console-send-line ()
  "Sends current line to the j-console-cmd session and exectues it"
  (interactive)
  (j-console-send-region (point-at-bol) (point-at-eol)))

(defun j-console-send-buffer ()
  "Sends current buffer to the j-console-cmd session and exectues it"
  (interactive)
  (j-console-send-region (point-min) (point-max)))

(add-hook 'j-mode-hook
	  (lambda ()
	    (define-key j-mode-map (kbd "C-c C-b") 'j-console-send-region)
	    (define-key j-mode-map (kbd "C-c C-l") 'j-console-send-line)
	    (define-key j-mode-map (kbd "C-c C-c") 'j-console-send-buffer)
	    (custom-set-faces
	     '(j-verb-face ((t (:foreground "Red"))))
	     '(j-adverb-face ((t (:foreground "Green"))))
	     '(j-conjunction-face ((t (:foreground "#ffc125"))))
	     '(j-other-face ((t (:foreground "#3b99fc")))))
	    (mapc (lambda (p)
		    (sp-local-pair 'j-mode p nil :actions nil))
		  '("{" "[" "\"" "`"))))

(add-hook 'inferior-j-mode-hook
	  (lambda ()
	    (define-key inferior-j-mode-map (kbd "C-c C-h") 'j-help-lookup-symbol-at-point)
	    (define-key inferior-j-mode-map (kbd "C-c h") 'j-help-lookup-symbol)
	    (set-syntax-table j-font-lock-syntax-table)
	    (set (make-local-variable 'comment-start)
		 "NB. ")
	    (set (make-local-variable 'comment-start-skip)
		 "\\(\\(^\\|[^\\\\\n]\\)\\(\\\\\\\\\\)*\\)NB. *")
	    (set (make-local-variable 'font-lock-comment-start-skip)
		 "NB. *")
	    (set (make-local-variable 'font-lock-defaults)
		 '(j-font-lock-keywords
		   nil nil nil nil
		   ;;(font-lock-mark-block-function . mark-defun)
		   (font-lock-syntactic-face-function
		    . j-font-lock-syntactic-face-function)))
	    (mapc (lambda (p)
		    (sp-local-pair 'inferior-j-mode p nil :actions nil))
		  '("{" "[" "\"" "`"))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;PYTHON
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package python
  :ensure t
  :config
  (setq python-shell-interpreter "ipython"
	python-shell-interpreter-args "-i --colors=linux --matplotlib"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Perl
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'auto-mode-alist '("\.\([pP][Llm]\|al\|t\|cgi\)\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))
(add-hook 'cperl-mode-hook
	  (lambda ()
	    (define-key cperl-mode-map "{" 'nil)))
;;; cperl-mode is preferred to perl-mode
;;; "Brevity is the soul of wit"
(defalias 'perl-mode 'cperl-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Factor
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package fuel
  :ensure t
  :commands factor-mode
  :init
  (require 'factor-mode)
  (setq fuel-listener-factor-binary "/Users/yagi/factor/factor")
  (setq fuel-listener-factor-image "/Users/yagi/factor/factor.image")
  (add-hook 'fuel-mode-hook
	    (lambda ()
	      (define-key factor-mode-map "\C-c\C-w" 'fuel-help))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; DATABASE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package sql-indent
  :ensure t
  :config
  (sql-set-product "postgres")
  (add-hook 'sql-mode
	    (lambda ()
	      (sql-set-product "postgres"))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; EWW BROWSER
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq browse-url-browser-function 'browse-url-default-browser)
;; (setq browse-url-browser-function 'eww-browse-url)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; GOOGLE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun google ()
  "search on google"
  (interactive)
  (let ((prefix "http://www.google.co.jp/search?q=")
	(word (read-string "google: " (if mark-active
					  (buffer-substring-no-properties
					   (region-beginning) (region-end))
					(current-word)))))
    (setq word (replace-regexp-in-string "[\s\n]+" "+" (concat prefix word)))
    (browse-url word)))
(bind-key "C-M-g" 'google global-map)
;;; translate
(use-package google-translate
  :ensure t)
(defvar google-translate-english-chars "[:ascii:]"
  "これらの文字が含まれているときは英語とみなす")
(defun google-translate-enja-or-jaen (&optional string)
  "regionか、現在の単語を言語自動判別でGoogle翻訳する。"
  (interactive)
  (setq string
        (cond ((stringp string) string)
              (current-prefix-arg
               (read-string "Google Translate: "))
              ((use-region-p)
               (buffer-substring (region-beginning) (region-end)))
              (t
               (current-word))))
  (let* ((asciip (string-match
                  (format "\\`[%s]+\\'" google-translate-english-chars)
                  string)))
    (run-at-time 0.1 nil 'deactivate-mark)
    (google-translate-translate
     (if asciip "en" "ja")
     (if asciip "ja" "en")
     string)))
(global-set-key (kbd "s-g") 'google-translate-enja-or-jaen)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Tree View
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package neotree
  :ensure t
  :bind
  (("s-t" . neotree-toggle))
  :config
  (setq neo-smart-open t)
  (setq neo-show-hidden-files t)
  :config
  (setq neo-theme 'ascii))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; COLOR THEME
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t))
