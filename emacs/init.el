;; Anselmo Lacerda Silveira de Melo
;; my .emacs

;; Resources:
;; .emacs at code.chenca.org
;;http://emacs-fu.blogspot.com/
;;http://www.emacswiki.org/
;;http://www.cs.utah.edu/dept/old/texinfo/emacs18/emacs_20.html
;;http://homepages.inf.ed.ac.uk/s0243221/emacs/
;;http://defindit.com/readme_files/emacs_tool_menu_bars.html
;;https://kb.mit.edu/confluence/display/ist/Disabling+the+Emacs+menubar,+toolbar,+or+scrollbar
;;http://as760.http.sasm3.net/textbooks/emacs/emacs_20.html
;;http://www.emacswiki.org/cgi-bin/wiki/sourcepair.el
;;http://geosoft.no/development/emacs.html
;;http://www.enigmacurry.com/2009/01/21/autocompleteel-python-code-completion-in-emacs/

; General stuff ;;;;;;;;;;;;;;;;;;;;;;;;;;
;; don't show startup messages
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
;; change where backups are stored
(setq make-backup-files t)
;(setq version-control t)
;(setq backup-directory-alist (quote ((".* .~/.emacs_backups/"))))
;(desktop-save-mode 1)

;; load-path : subdirs
;; off because it made emacs startup deadly slow
;(normal-top-level-add-subdirs-to-load-path)

;; python-mode - not used now
;;(autoload 'python-mode "python-mode.el" "Python mode." t)
;;(setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) auto-mode-alist))

(require 'python)

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; load espress-mode, javascript mode (including for qml files
(autoload #'espresso-mode "espresso" "Start espresso-mode" t)
(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.qml$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))

;; column limit
(setq text-mode-hook 'turn-on-auto-fill); automatically auto-fill
(setq-default default-fill-column 100)	; 72
(setq default-comment-column 40)	;
(setq ask-about-buffer-names t)		; be helpful
(setq completion-auto-help t)		;    with buffer names
(setq insert-default-directory t)       ; be helpful with file paths
(setq default-truncate-lines t)         ; truncate, not wrap, long lines
(setq default-case-fold-search t)       ; t = upper/lower case same
(setq next-screen-context-lines 4)      ; overlap when scroll off screen

;; Always end a file with a newline
(setq require-final-newline t)


; Look & feel ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(mouse-wheel-mode t) ; enable mouse wheel
;; colors
(set-background-color "black")
(set-foreground-color "white")
(set-mouse-color "goldenrod")
(set-cursor-color "red")
(global-hl-line-mode 1)
;;(set-face-background 'hl-line "#666")
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "black" :foreground "gray" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :family "dejavu sans mono")))))
(transient-mark-mode t)
(setq search-highlight           t) ; Highlight search object
(setq query-replace-highlight    t) ; Highlight query object
(setq mouse-sel-retain-highlight t) ; Keep mouse high-lightening
(menu-bar-mode 0)      ; gui parameters: no menu
(tool-bar-mode 0)      ; and no toolbar
(toggle-scroll-bar 0)  ; no scroll-bar
(column-number-mode t) ; show column number
(line-number-mode t)   ; show line number

(setq scroll-step 1)    ; scroll line by line
(setq visible-bell nil) ; disable visible bell
(fset 'yes-or-no-p 'y-or-n-p) ; because I can write only y/n instead of yes/no...

;; highlight trailing whitespace
(setq-default show-trailing-whitespace t)
(setq-default default-indicate-empty-lines t)
(setq-default indent-tabs-mode nil)

;; show matching parentheses
(show-paren-mode t)

;; keyboard shortcuts
(global-set-key [\C-tab] 'bs-cycle-next) ; Ctrl-Tab and Ctrl-Shift-Tab cycle through buffers
;(global-set-key [\C-\S-tab] 'bs-cycle-previous)
(global-set-key "\M-c" 'compile)
;(global-set-key "\C-x\C-e" 'compile)
(global-set-key "\C-g" 'goto-line)
(global-set-key [f5] 'delete-trailing-whitespace)
;(global-set-key "\C-z" 'undo)
;(global-set-key "\C-c" 'copy-region-as-kill);;copy
;(global-set-key "\C-v" 'yank);;paste
(global-set-key [delete] 'delete-char)
;(global-set-key [home] 'beginning-of-buffer)
;(global-set-key [end] 'end-of-buffer)
(global-set-key [f6] 'ff-find-other-file)
(global-set-key [f9] 'kill-buffer)

;; C/C++
(require 'cc-mode)
(setq-default indent-tabs-mode nil)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
;(setq-default c-basic-offset 2) ;tabsize
(setq-default c-basic-offset 4) ;tabsize

(defun fast-uncomment-region ()
  (local-set-key [(control c)(control u)] 'uncomment-region))


;; C++ autocompletion
(defconst c++-keywords
  (sort
   (list "and" "bool" "compl" "do" "export" "goto" "namespace" "or_eq" "return"
	 "struct" "try" "using" "xor" "and_eq" "break" "const" "double" "extern"
	 "if" "new" "private" "short" "switch" "typedef" "virtual" "xor_eq" "asm"
	 "case" "const_cast" "dynamic_cast" "false" "inline" "not" "protected"
	 "signed" "template" "typeid" "void" "auto" "catch" "continue" "else"
	 "float" "int" "not_eq" "public" "sizeof" "this" "typename" "volatile"
	 "bitand" "char" "default" "enum" "for" "long" "operator" "register"
	 "static" "throw" "union" "wchar_t" "bitor" "class" "delete" "explicit"
	 "friend" "mutable" "or" "reinterpret_cast" "static_cast" "true"
	 "unsigned" "while" ) #'(lambda (a b) (> (length a) (length b)))))

(defvar ac-source-c++
  '((candidates
     . (lambda ()
	 (all-completions ac-target c++-keywords))))
  "Source for c++ keywords.")

(add-hook 'c++-mode-hook
	  (lambda ()
	  (make-local-variable 'ac-sources)
	  (setq ac-sources '(ac-source-c++))))

; C-X B: list buffers
(iswitchb-mode)

(modify-frame-parameters nil '((wait-for-wm . nil)))
