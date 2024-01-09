(defvar elpaca-installer-version 0.6)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (< emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                 ((zerop (call-process "git" nil buffer t "clone"
                                       (plist-get order :repo) repo)))
                 ((zerop (call-process "git" nil buffer t "checkout"
                                       (or (plist-get order :ref) "--"))))
                 (emacs (concat invocation-directory invocation-name))
                 ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                       "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                 ((require 'elpaca))
                 ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

(setq elpaca-queue-limit 15)

;; https://github.com/progfolio/elpaca/blob/master/README.md#L79
(when (eq system-type 'windows-nt)
  (elpaca-no-symlink-mode))

(elpaca elpaca-use-package
  (elpaca-use-package-mode)
  (setq elpaca-use-package-by-default t))
;; (elpaca general)

(elpaca-wait)

(use-package catppuccin-theme
  :init (load-theme 'catppuccin t))

(use-package company)
(use-package company-quickhelp)
;; (elpaca bind-key
;;   (require 'bind-key))
(use-package eglot)

(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)
;; (bind-key "C-M-i" 'company-complete)
;; (bind-key "C-h" nil company-active-map)
;; (bind-key "C-n" 'company-select-next company-active-map)
;; (bind-key "C-p" 'company-select-previous company-active-map)
;; (bind-key "C-n" 'company-select-next company-search-map)
;; (bind-key "C-p" 'company-select-previous company-search-map)
;; (bind-key "<tab>" 'company-complete-common-or-cycle company-active-map)
;; (bind-key "<backtab>" 'company-select-previous company-active-map)
;; (bind-key "C-i" 'company-completion-selection company-active-map)
;; (bind-key "M-d" 'company-show-doc-buffer company-active-map)
;; (add-hook 'after-init-hook 'global-company-mode)
(setq company-tooltip-maximum-width 50)

;; company-quickhelp
(setq company-quickhelp-color-foreground "white")
(setq company-quickhelp-color-background "dark slate gray")
(setq company-quickhelp-max-lines 5)
;; (company-quickhelp-mode)

;;(with-eval-after-load 'eglot
;;  (add-to-list 'eglot-server-programs
;;	       '((ruby-mode ruby-ts-mode) "solargraph")))

;; fuzzy finder
(elpaca projectile
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))
(require 'recentf)

;; Git
(elpaca magit
  (global-set-key (kbd "C-x g") 'magit-status))

;; Ruby
(add-hook 'ruby-mode-hook 'eglot-ensure)
;; (projectile-rails-global-mode)

;; Setting for org-mode
(setq org-directory "~/OneDrive/org")
(setq org-agenda-files (list "inbox.org" "agenda.org" "tasks.org"))

(setq org-default-notes-file (concat org-directory "/tasks.org"))
(setq org-capture-templates
      `(("i" "Inbox" entry (file "inbox.org"))))
(define-key global-map (kbd "C-c i") 'org-capture-inbox)

(define-key global-map (kbd "C-c a") 'org-agenda)
(setq org-agenda-hide-tags-regexp ".")
(setq org-agenda-prefix-format
      '((agenda . " %i %-12:c%?-12t% s")
        (todo   . " ")
        (tags   . " %i %-12:c")
        (search . " %i %-12:c")))

(elpaca org-roam)

(elpaca vertico)
(elpaca consult-codesearch)
(elpaca consult-company)
(elpaca consult-dir)
(elpaca consult-eglot)
(elpaca consult-flycheck)
(elpaca consult-ghq)
(elpaca consult-ls-git)
(elpaca consult-lsp)
(elpaca consult-org-roam)
(elpaca consult-projectile)
(elpaca marginalia)
(elpaca orderless)
(elpaca embark)
(elpaca embark-consult)

;; general settings
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-selection-coding-system 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
(set-file-name-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(setq locale-coding-system 'utf-8-unix)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(provide 'init)
