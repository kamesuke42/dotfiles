;; general settings
(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write  'utf-8)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(magit catppuccin-theme))
 '(warning-suppress-log-types '((comp) ((unlock-file))))
 '(warning-suppress-types '(((unlock-file)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "HackGen Console NFJ" :foundry "outline" :slant normal :weight regular :height 98 :width normal)))))

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(defun open-init-el
    (interactive)
  (find-file "~/.emacs.d/init.el"))

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(load-theme 'catppuccin :no-confirm)

;; org
(setq org-agenda-files '("d:/OneDrive/org/"))
(define-key global-map "\C-ca" 'org-agenda)
(setq org-todo-keywords
      '((sequence "INBOX(i)" "REMIND(r)" "TODAY(t)" "THIS WEEK(w)" "|" "DONE(d)" "SOMEDAY(s)")))

(defun my-after-save-actions ()
  "Used in `after-save-hook`"
  (when (memq this-command '(save-buffer save-some-buffers))
    (if (eq major-mode 'org-mode) (write-region nil nil
				   (replace-regexp-in-string "\\(\.org$\\)" ".txt" (buffer-file-name) nil nil 1) t))))

(write-region nil nil "c:/Users/kamesuke42/Desktop/test.txt" t)

(add-hook 'after-save-hook 'my-after-save-actions)
