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

;; Don't prompt for C-c C-k
(setq cider-save-file-on-load t)

;; Don't jump to warnings for C-c C-k
(setq cider-auto-jump-to-error 'errors-only)

;; https://docs.cider.mx/cider/caveats.html#_injecting_dependencies_and_leiningen_pedantic_abort_mode
(setq cljr-suppress-middleware-warnings t)
;; Don't need this with managed-dependencies in profiles.clj
;; (setq cider-inject-dependencies-at-jack-in nil)

;; Want to know when tests have finished
(setq cider-test-show-report-on-success t)

;; https://github.com/noctuid/lispyville#key-themes
(setq lispyville-key-theme
      '((operators normal)
        c-w
        (prettify insert)
        (atom-movement normal visual)
        slurp/barf-lispy
        additional
        additional-insert
        ;; custom
        additional-movement))

;; Don't go straight to file finder.
(setq +workspaces-switch-project-function #'magit-status)

;; https://github.com/radian-software/apheleia/issues/278
(after! apheleia
  (setf (alist-get 'rustfmt  apheleia-formatters)
        '("rustfmt" "--quiet" "--emit" "stdout" "--edition" "2021")))

(after! rustic
  (setq rustic-compile-backtrace "1"))

(after! lsp-mode
  (setq lsp-inlay-hint-enable t
        lsp-rust-clippy-preference "on"))
