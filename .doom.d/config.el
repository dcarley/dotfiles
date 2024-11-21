;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)
(setq projectile-project-search-path '("~/projects/dcarley/"
                                       "~/projects/flox/"))

;; Auto-install font. Can't use custom oath from Flox provided `nerdfonts`.
(unless (member "Symbols Nerd Font Mono" (font-family-list))
  (nerd-icons-install-fonts t))

;; Change comments from light grey.
(setq doom-one-brighter-comments t)

;; Don't go straight to file finder.
(setq +workspaces-switch-project-function #'magit-status)

(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))

;; (use-package! copilot-chat)

(after! apheleia
  ;; https://github.com/radian-software/apheleia/issues/278
  (setf (alist-get 'rustfmt  apheleia-formatters)
        '("rustfmt" "--quiet" "--emit" "stdout" "--edition" "2021")))

(after! rustic
  (setq rustic-compile-backtrace "1"))

(after! lsp-mode
  (setq lsp-inlay-hint-enable t
        lsp-rust-clippy-preference "on"))
