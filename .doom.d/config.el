;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)
(setq projectile-project-search-path '("~/projects/go/src/github.com/dcarley/"
                                       "~/projects/go/src/github.com/circleci/"))
