;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:fetcher github :repo "username/repo"))
;; (package! builtin-package :disable t)

;; https://github.com/copilot-emacs/copilot.el
(package! copilot
  :recipe (:host github :repo "copilot-emacs/copilot.el" :files ("*.el")))

;; https://github.com/chep/copilot-chat.el
;; https://github.com/copilot-emacs/copilot.el/issues/199
;; https://github.com/copilot-emacs/copilot.el/pull/343
;; (package! copilot-chat
;;   :recipe (:host github :repo "chep/copilot-chat.el" :files ("*.el")))
