(require 'package)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
	;; ("melpa-stable" . "https://stable.melpa.org/packages")
	("org" . "https://orgmode.org/elpa")
	("gnu" . "https://elpa.gnu.org/package")))
(package-initialize)
