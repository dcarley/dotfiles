;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)
(setq projectile-project-search-path '("~/projects/go/src/github.com/dcarley/"
                                       "~/projects/go/src/github.com/circleci/"))

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
