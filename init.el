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
(setq default-tab-width 2)
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
;;; Add melpa
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;; Add marmalade
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
					; Initialize

(package-initialize)
;; (package-refresh-contents)
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
; ("M-i" . sp-splice-sexp-killing-forward)
 
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
;;; ESHELL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
	 [default default default italic underline success warning error])
 '(ansi-color-names-vector
	 ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
	 (quote
		("f3d6a49e3f4491373028eda655231ec371d79d6d2a628f08d5aa38739340540b" "07dda9a3249f9ac909e7e0dc3c8876fd45898aa21646e093148dbd6ebb294f66" default)))
 '(eshell-prompt-function
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
 '(eshell-prompt-regexp "^\\(\\[[^]
]+\\]\\|[$#] \\)")
 '(org-agenda-files
	 (quote
		("~/Documents/Jugyou/2016/ComputerArchitecture/ca.org"))))
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
(package-install 'pretty-lambdada)
(require 'chicken-scheme)
(setq scheme-program-name "csi -qw")
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

(defun my-scheme-hook ()
  (set (make-variable-buffer-local
	'paredit-space-for-delimiter-predicates)
       (list #'paredit-space-for-delimiter-p-chicken))
  (setup-chicken-scheme)
  (enable-paredit-mode)
  (auto-complete-mode t)
  (bind-key "C-?" 'chicken-show-help scheme-mode-map)
  (pretty-lambda-mode t))
(add-hook 'scheme-mode-hook
	  (lambda ()
	    (my-scheme-hook)))
(add-hook 'inferior-scheme-mode-hook
	  (lambda ()
	    (my-scheme-hook)))
(setq auto-insert-alist 
      '(("\\.scm" . 
         (insert "#!/bin/sh\n#| -*- scheme -*-\nexec csi -s $0 \"$@\"\n|#\n"))))
;; from shiro  gauche info 
;; 
(put 'and-let* 'scheme-indent-function 1)
(put 'begin0 'scheme-indent-function 0)
(put 'call-with-client-socket 'scheme-indent-function 1)
(put 'call-with-input-conversion 'scheme-indent-function 1)
(put 'call-with-input-file 'scheme-indent-function 1)
(put 'call-with-input-process 'scheme-indent-function 1)
(put 'call-with-input-string 'scheme-indent-function 1)
(put 'call-with-iterator 'scheme-indent-function 1)
(put 'call-with-output-conversion 'scheme-indent-function 1)
(put 'call-with-output-file 'scheme-indent-function 1)
(put 'call-with-output-string 'scheme-indent-function 0)
(put 'call-with-temporary-file 'scheme-indent-function 1)
(put 'call-with-values 'scheme-indent-function 1)
(put 'dolist 'scheme-indent-function 1)
(put 'dotimes 'scheme-indent-function 1)
(put 'if-match 'scheme-indent-function 2)
(put 'let*-values 'scheme-indent-function 1)
(put 'let-args 'scheme-indent-function 2)
(put 'let-keywords* 'scheme-indent-function 2)
(put 'let-match 'scheme-indent-function 2)
(put 'let-optionals* 'scheme-indent-function 2)
(put 'let-syntax 'scheme-indent-function 1)
(put 'let-values 'scheme-indent-function 1)
(put 'let/cc 'scheme-indent-function 1)
(put 'let1 'scheme-indent-function 2)
(put 'letrec-syntax 'scheme-indent-function 1)
(put 'make 'scheme-indent-function 1)
(put 'multiple-value-bind 'scheme-indent-function 2)
(put 'match 'scheme-indent-function 1)
(put 'parameterize 'scheme-indent-function 1)
(put 'parse-options 'scheme-indent-function 1)
(put 'receive 'scheme-indent-function 2)
(put 'rxmatch-case 'scheme-indent-function 1)
(put 'rxmatch-cond 'scheme-indent-function 0)
(put 'rxmatch-if  'scheme-indent-function 2)
(put 'rxmatch-let 'scheme-indent-function 2)
(put 'syntax-rules 'scheme-indent-function 1)
(put 'unless 'scheme-indent-function 1)
(put 'until 'scheme-indent-function 1)
(put 'when 'scheme-indent-function 1)
(put 'while 'scheme-indent-function 1)
(put 'with-builder 'scheme-indent-function 1)
(put 'with-error-handler 'scheme-indent-function 0)
(put 'with-error-to-port 'scheme-indent-function 1)
(put 'with-input-conversion 'scheme-indent-function 1)
(put 'with-input-from-port 'scheme-indent-function 1)
(put 'with-input-from-process 'scheme-indent-function 1)
(put 'with-input-from-string 'scheme-indent-function 1)
(put 'with-iterator 'scheme-indent-function 1)
(put 'with-module 'scheme-indent-function 1)
(put 'with-output-conversion 'scheme-indent-function 1)
(put 'with-output-to-port 'scheme-indent-function 1)
(put 'with-output-to-process 'scheme-indent-function 1)
(put 'with-output-to-string 'scheme-indent-function 1)
(put 'with-port-locking 'scheme-indent-function 1)
(put 'with-string-io 'scheme-indent-function 1)
(put 'with-time-counter 'scheme-indent-function 1)
(put 'with-signal-handlers 'scheme-indent-function 1)
(put 'with-locking-mutex 'scheme-indent-function 1)
(put 'guard 'scheme-indent-function 1)
(put 'handle-exceptions 'scheme-indent-function 2)
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
			(define-key ruby-mode-map "\C-c\C-c" 'ruby-send-buffer)
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
;;; GFORTH
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'forth-mode "gforth.el")
(setq auto-mode-alist (cons '("\\.fs\\'" . forth-mode)
			    auto-mode-alist))
(autoload 'forth-block-mode "gforth.el")
(setq auto-mode-alist (cons '("\\.fb\\'" . forth-block-mode)
			    auto-mode-alist))

(add-hook 'forth-mode-hook
	  (lambda ()
	    (setq forth-indent-level 4)
	    (setq forth-minor-indent-level 2)
	    (setq forth-hilight-level 3)
	    (bind-key "C-<return>" 'forth-send-paragraph forth-mode-map)
	    (bind-key "C-c C-b" 'forth-send-buffer forth-mode-map)
	    (auto-complete-mode t)
	    (unbind-key "C-h" forth-mode-map)
					;(run-forth)
	    (cua-mode -1)
	    ))

(add-hook 'inferior-forth-mode-hook
	  (lambda ()
	    (unbind-key "C-c C-z" inferior-forth-mode-map)
	    (bind-key "C-c C-z" 'forth-switch-to-interactive inferior-forth-mode-map)
	    (auto-complete-mode t)))


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
;;; nginx
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-install 'nginx-mode)
(require 'nginx-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; web-mode emmet-mode 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-install 'web-mode)
(package-install 'emmet-mode)
(package-install 'ac-html)
(require 'web-mode)
(require 'emmet-mode)
(require 'ac-html)
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2)))
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
;;; HTML, CSS, SCSS, HAML, yaml
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-install 'scss-mode)
(package-install 'haml-mode)
(package-install 'yaml-mode)
(require 'yaml-mode)
(require 'haml-mode)
(require 'scss-mode)
(defun setup-ac-for-haml ()
  ;; haml auto completion
  (require 'ac-haml)
  ;; ?
  (require 'ac-html-default-data-provider)
  (ac-html-enable-data-provider 'ac-html-default-data-provider)
  (ac-haml-setup)
  (setq ac-sources '(ac-source-haml-tag
		     ac-source-haml-attr
		     ac-source-haml-attrv))
  (auto-complete-mode t))
(add-hook 'haml-mode-hook 'setup-ac-for-haml)
(add-hook 'html-mode-hook
	  (lambda ()
	    (sgml-electric-tag-pair-mode t)
	    (set (make-local-variable 'sgml-basic-offset) 2)
	    (auto-complete-mode t)
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
;; (add-hook 'yaml-mode-hook
;; 	  (lambda ()
;; 	    (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ORG-MODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-install 'org)
(require 'org)
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
(package-install 'graphviz-dot-mode)
(require 'graphviz-dot-mode)

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
(package-install 'google-translate)
(require 'google-translate)
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
;;; COLOR THEME
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-install 'zenburn-theme)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
