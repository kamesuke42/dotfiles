(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(defun custom-install (name callback)
  "Install a package if not installed"
  (interactive)
  (if (require name)
      ()
    (pacakge-install name))
  callback)

(custom-install 'catppuccin-theme (load-theme 'catppuccin :no-confirm))
