;; .emacs.d/init.el

;; ===================================
;; MELPA Package Support
;; ===================================
;; Enables basic packaging support
(require 'package)
(require 'muse-mode)     ; load authoring mode
     
(require 'muse-html)     ; load publishing styles I use
(require 'muse-latex)
(require 'muse-context)
    
(require 'muse-project)  ; publish files in projects

;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Initializes the package infrastructure
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))

;; Installs packages
;;
;; myPackages contains a list of package names
(defvar myPackages
  '(better-defaults                 ;; Set up some better Emacs defaults
    blacken                         ;; Black formatting on save
    ein                             ;; Emacs IPython Notebook
    elpy                            ;; Emacs Lisp Python Environment
    flycheck                        ;; On the fly syntax checking
    material-theme                  ;; Theme
    )
  )

;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

;; ===================================
;; Basic Customization
;; ===================================

(setq inhibit-startup-message t)    ;; Hide the startup message
(load-theme 'material t)            ;; Load material theme
(global-linum-mode t)               ;; Enable line numbers globally

;; User-Defined init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(elpy elpygen projectile jedi evil material-theme better-defaults)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ====================================
;; Development Setup
;; ====================================
;; Enable elpy
(elpy-enable)

;(defun elpy--xref-backend ()
;  "Return the name of the elpy xref backend."
;  (if (or (and (not (elpy-rpc--process-buffer-p elpy-rpc--buffer))
;               (elpy-rpc--get-rpc-buffer))
;          elpy-rpc--jedi-available)
;      'elpy
;    nil))

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Enable Blacken on save
;(add-hook 'python-mode-hook 'blacken-mode)

;; Unleash Evil mode

;;; from purcell/emacs.d
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(require-package 'evil)

(setq evil-search-module 'evil-search
      evil-want-C-u-scroll t
      evil-want-C-w-in-emacs-state t)

(require 'evil)
(evil-mode t)

(defun find-file-save-directory ()
    (interactive)
    (setq saved-default-directory default-directory)
    (ido-find-file)
    (setq default-directory saved-default-directory))
(global-set-key "\C-x\C-f" 'find-file-save-directory)

(add-to-list 'load-path "~/.emacs.d/speedbar")
(require 'sr-speedbar)

(modify-syntax-entry ?_ "w")
