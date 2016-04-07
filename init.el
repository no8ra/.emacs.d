(prefer-coding-system 'utf-8)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key [(super f)] 'toggle-frame-fullscreen)
(show-paren-mode t)
(setq scroll-conservatively 1)
(global-auto-revert-mode 1)
(put 'set-goal-column 'disabled nil)
(column-number-mode t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(set-scroll-bar-mode nil)
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(fset 'yes-or-no-p 'y-or-n-p)
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
; Add package-archives
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/")) ; ついでにmarmaladeも追加
; Initialize
(package-initialize)
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
(package-install 'bind-key)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; auto complete
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-install 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(when (require 'auto-complete nil t)
  (global-auto-complete-mode t)
  (setq ac-auto-show-menu 0.5)
  (setq ac-auto-start 2)
  (bind-key "C-n" 'ac-next ac-complete-mode-map)
  (bind-key "C-p" 'ac-previous ac-complete-mode-map))
(global-set-key "\C-x\C-@" 'auto-complete-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; auto insert 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'autoinsert)
(add-hook 'find-file-hooks 'auto-insert)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; anzu
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-install 'anzu)
(require 'anzu)
(global-anzu-mode +1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; smartparens
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-install 'smartparens)
(bind-keys 
 :map smartparens-mode-map   
 ("M-l" . sp-forward-barf-sexp)
 ("M-h" . sp-backward-barf-sexp)
 ("M-j" . sp-backward-slurp-sexp)
 ("M-k" . sp-forward-slurp-sexp)

 ("M-u" . sp-splice-sexp-killing-backward)
 ("M-i" . sp-splice-sexp-killing-forward)
 
 ("C-M-<backspace>"   . sp-backward-kill-sexp)
 ("C-M-a" . sp-beginning-of-sexp)
 ("C-M-e" . sp-end-of-sexp)
 ("C-M-f" . sp-forward-sexp)
 ("C-M-b" . sp-backward-sexp)
 ("C-M-n" . sp-next-sexp)
 ("C-M-p" . sp-previous-sexp)   
 )
(smartparens-global-mode)
(add-hook 'lisp-mode-hook  'turn-off-smartparens-mode)
(add-hook 'scheme-mode-hook 'turn-off-smartparens-mode)
(add-hook 'inferior-scheme-mode-hook 'turn-off-smartparens-mode)
(add-hook 'emacs-lisp-mode-hook 'turn-off-smartparens-mode)
(add-hook 'slime-mode-hook 'turn-off-smartparens-mode)
(add-hook 'slime-repl-mode-hook 'turn-off-smartparens-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; paredit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-install 'paredit)
(when (require 'paredit)
  (bind-keys 
   :map paredit-mode-map   
   ("M-l" . paredit-forward-barf-sexp)
   ("M-h" . paredit-backward-barf-sexp)
   ("M-j" . paredit-backward-slurp-sexp)
   ("M-k" . paredit-forward-slurp-sexp)

   ("M-u" . paredit-splice-sexp-killing-backward)
   ("M-i" . paredit-splice-sexp-killing-forward)
   
   ("C-h" . paredit-backward-delete)
   ("C-M-f" . paredit-forward)
   ("C-M-b" . paredit-backward)
   ))
(add-hook 'scheme-mode-hook 'enable-paredit-mode)
(add-hook 'geiser-mode 'enable-paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interacton-mode-hook 'enable-paredit-mode)
(add-hook 'slime-mode-hook 'enable-paredit-mode)
(add-hook 'slime-repl-mode-hook 'enable-paredit-mode)
(add-hook 'inferior-scheme-mode-hook 'enable-paredit-mode)
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; helm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-install 'helm)
(package-install 'ac-helm)
(require 'helm-config)
(require 'ac-helm)
(helm-mode 1)
(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
(define-key global-map (kbd "M-y")     'helm-show-kill-ring)
(define-key global-map (kbd "C-c i")   'helm-imenu)
(define-key global-map (kbd "C-x b")   'helm-buffers-list)
(define-key global-map (kbd "M-r")     'helm-resume)
(define-key global-map (kbd "C-M-h")   'helm-apropos)
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
;; Disable helm in some functions
(add-to-list 'helm-completing-read-handlers-alist '(find-alternate-file . nil))
(add-to-list 'helm-completing-read-handlers-alist '(find-tag . nil))
(setq helm-buffer-details-flag nil)
;; Emulate `kill-line' in helm minibuffer
(setq helm-delete-minibuffer-contents-from-point t)
(defadvice helm-delete-minibuffer-contents (before emulate-kill-line activate)
  "Emulate `kill-line' in helm minibuffer"
  (kill-new (buffer-substring (point) (field-end))))
(defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-file-exist activate)
  "Execute command only if CANDIDATE exists"
  (when (file-exists-p candidate)
    ad-do-it))

(setq helm-ff-fuzzy-matching nil)
(defadvice helm-ff--transform-pattern-for-completion (around my-transform activate)
  "Transform the pattern to reflect my intention"
  (let* ((pattern (ad-get-arg 0))
	 (input-pattern (file-name-nondirectory pattern))
	 (dirname (file-name-directory pattern)))
    (setq input-pattern (replace-regexp-in-string "\\." "\\\\." input-pattern))
    (setq ad-return-value
	  (concat dirname
		  (if (string-match "^\\^" input-pattern)
		      ;; '^' is a pattern for basename
		      ;; and not required because the directory name is prepended
		      (substring input-pattern 1)
		    (concat ".*" input-pattern))))))

(defun helm-buffers-list-pattern-transformer (pattern)
  (if (equal pattern "")
      pattern
    (let* ((first-char (substring pattern 0 1))
	   (pattern (cond ((equal first-char "*")
			   (concat " " pattern))
			  ((equal first-char "=")
			   (concat "*" (substring pattern 1)))
			  (t
			   pattern))))
      ;; Escape some characters
      (setq pattern (replace-regexp-in-string "\\." "\\\\." pattern))
      (setq pattern (replace-regexp-in-string "\\*" "\\\\*" pattern))
      pattern)))


(unless helm-source-buffers-list
  (setq helm-source-buffers-list
	(helm-make-source "Buffers" 'helm-source-buffers)))
(add-to-list 'helm-source-buffers-list
	     '(pattern-transformer helm-buffers-list-pattern-transformer))

(defadvice helm-ff-sort-candidates (around no-sort activate)
  "Don't sort candidates in a confusing order!"
  (setq ad-return-value (ad-get-arg 0)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Projectile
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (package-install 'projectile)
;; 					; (package-install 'helm-projectile)
;; 					; (require 'helm-projectile)
;; (require 'projectile)
;; (projectile-global-mode)
;; (package-install 'projectile-rails)
;; (add-hook 'projectile-mode-hook 'projectile-rails-on)

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
;;; CLANG
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-install 'auto-complete-clang)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; LISP (SLIME)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-install 'slime)
(package-install 'ac-slime)
(require 'slime)
(require 'ac-slime)
(slime-setup '(slime-repl slime-fancy slime-banner))
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(setq inferior-lisp-program "sbcl")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; popwin
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-install 'popwin)
(require 'popwin)
(require 'popup)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-height 0.5)
(defvar popwin:special-display-config-backup popwin:special-display-config)
(setq popwin:special-display-config
      (append '(("*Remember*" :stick t)("*Org Agenda*")("*Backtrace*")
		("*sdic*" :noselect))
	      popwin:special-display-config))
;; Apropos
(push '("*slime-apropos*") popwin:special-display-config)
;; Macroexpand
(push '("*slime-macroexpansion*") popwin:special-display-config)
;; Help
(push '("*slime-description*") popwin:special-display-config)
;; Compilation
(push '("*slime-compilation*" :noselect t) popwin:special-display-config)
;; Cross-reference
(push '("*slime-xref*") popwin:special-display-config)
;; Debugger
(push '(sldb-mode :stick t) popwin:special-display-config)
;; REPL
(push '(slime-repl-mode) popwin:special-display-config)
;; Connections
(push '(slime-connection-list-mode) popwin:special-display-config)
;; helm show kill ring
(push '("*helm kill ring*") popwin:special-display-config)
(push '("^\*helm .+\*$" :regexp t) popwin:special-display-config)
(define-key global-map (kbd "C-x p") 'popwin:display-last-buffer)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; SCHEME
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-install 'chicken-scheme)
(require 'chicken-scheme)
(autoload 'scheme-mode "cmuscheme" "Marjor mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)
(require 'cmuscheme)
(define-key scheme-mode-map "\C-c\C-l" 'scheme-load-current-file)
(define-key scheme-mode-map "\C-c\C-k" 'scheme-compile-current-file)
(defun scheme-load-current-file (&optional switch)
  (interactive "P")
  (let ((file-name (buffer-file-name)))
    (comint-check-source file-name)
    (setq scheme-prev-l/c-dir/file (cons (file-name-directory    file-name)
					 (file-name-nondirectory file-name)))
    (comint-send-string (scheme-proc) (concat "(load \""
					      file-name
					      "\"\)\n"))
    (if switch
      (switch-to-scheme t)
      (message "\"%s\" loaded." file-name) ) ) )
(defun scheme-compile-current-file (&optional switch)
  (interactive "P")
  (let ((file-name (buffer-file-name)))
    (comint-check-source file-name)
    (setq scheme-prev-l/c-dir/file (cons (file-name-directory    file-name)
					 (file-name-nondirectory file-name)))
    (message "compiling \"%s\" ..." file-name)
    (comint-send-string (scheme-proc) (concat "(compile-file \""
					      file-name
					      "\"\)\n"))
    (if switch
      (switch-to-scheme t)
      (message "\"%s\" compiled and loaded." file-name) ) ) )
(setq default-scheme-implementation 'csi)
(add-hook 'scheme-mode-hook
	  (lambda ()
	    (setup-chicken-scheme)))
(add-hook 'inferior-scheme-mode-hook
	  (lambda ()
	    (setup-chicken-scheme)))
(setq auto-insert-alist 
      '(("\\.scm" . 
         (insert "#!/bin/sh\n#| -*- scheme -*-\nexec csi -s $0 \"$@\"\n|#\n"))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; RUBY
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-install 'inf-ruby)
(package-install 'flymake-ruby)
(package-install 'robe )
(package-install 'ruby-end)
(package-install 'ruby-block)
; (package-install 'rhtml-mode)
(require 'ruby-end)
(require 'ruby-block)
(require 'ac-robe)
(require 'flymake-ruby)
(require 'robe)
; (require 'rhtml-mode)

(add-hook 'ruby-mode-hook
	  (lambda ()
	    (inf-ruby-minor-mode)
	    (robe-mode)
	    (flymake-ruby-load)
	    (ruby-block-mode t)
	    (when (require 'rcodetools)
	      (define-key ruby-mode-map (kbd "<C-tab>") 'rct-complete-symbol)
	      (define-key ruby-mode-map (kbd "<C-return>") 'xmp))
					;(eldoc-mode t)
	    ))
(add-hook 'inf-ruby-mode-hook
	  (lambda ()
	    (robe-mode)
	    (auto-complete-mode t)
	    ;(eldoc-mode t)
	    ))
(add-hook 'robe-mode-hook
	  (lambda ()
	    (ac-robe-setup)
	    ))



;;; rails
(package-install 'rinari)
(require 'rinari)
(global-rinari-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; GIT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-install 'magit)
(require 'magit)
(bind-key "C-x g" 'magit-status global-map)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; direx
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-install 'direx)
(require 'direx-project)
(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)
(defun direx:jump-to-project-directory ()
  (interactive)
  (let ((result (ignore-errors
                  (direx-project:jump-to-project-root-other-window)
                  t)))
    (unless result
      (direx:jump-to-directory-other-window))))
(global-set-key (kbd "C-x C-j") 'direx:jump-to-project-directory)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; web-mode emmet-mode 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-install 'web-mode)
(package-install 'emmet-mode)
(require 'web-mode)
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))
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
  (sp-local-pair "<%" "%>"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; HTML
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'html-mode-hook
	  (lambda ()
	    (sgml-electric-tag-pair-mode t)
	    (set (make-local-variable 'sgml-basic-offset) 2)
	    (auto-complete-mode t)
	    ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; PHP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-install 'php-mode)
(require 'php-mode)
(add-hook 'php-mode-hook
	  (lambda ()
	    (php-eldoc-enable)
	    ;; (c-set-offset 'case-label' 4)
	    ;; (c-set-offset 'arglist-intro' 4)
	    ;; (c-set-offset 'arglist-cont-nonempty' 4)
	    ;; (c-set-offset 'arglist-close' 0)
	    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; GOOGLE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; COLOR THEME
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-install 'zenburn-theme)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
    ("f3d6a49e3f4491373028eda655231ec371d79d6d2a628f08d5aa38739340540b" "07dda9a3249f9ac909e7e0dc3c8876fd45898aa21646e093148dbd6ebb294f66" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
