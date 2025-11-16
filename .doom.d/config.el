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
              ("C-<tab>" . 'copilot-accept-completion-by-word)
              ("C-n" . 'copilot-next-completion)
              ("C-p" . 'copilot-previous-completion))
  :init (setq copilot-disable-prompt-on-indent-offset-warning t)
  :config (when (file-exists-p copilot-install-dir)
            (copilot-uninstall-server)))

(after! gptel
  (setq gptel-backend (gptel-make-gh-copilot "Copilot")
        gptel-model 'claude-sonnet-4.5))

(after! apheleia
  ;; https://github.com/radian-software/apheleia/issues/278
  (setf (alist-get 'rustfmt  apheleia-formatters)
        '("rustfmt" "--quiet" "--emit" "stdout" "--edition" "2024")))

(after! rustic
  (setq rustic-compile-backtrace "1"))

(after! lsp-mode
  (setq lsp-inlay-hint-enable t
        lsp-rust-clippy-preference "on")
  ;; https://github.com/emacs-lsp/lsp-mode/pull/4620
  ;; (setq lsp-bash-allowed-shells '(sh bash bats))
  (defun my-lsp-bash-check-sh-shell (&rest _)
    (memq sh-shell '(sh bash bats)))
  (advice-add #'lsp-bash-check-sh-shell :override #'my-lsp-bash-check-sh-shell))

;; https://github.com/doomemacs/doomemacs/issues/581#issuecomment-645448095
(defun doom/ediff-init-and-example ()
  "ediff the current `init.el' with the example in doom-user-dir"
  (interactive)
  (ediff-files (concat doom-user-dir "init.el")
               (concat doom-emacs-dir "static/init.example.el")))
(define-key! help-map
  "di" #'doom/ediff-init-and-example)
