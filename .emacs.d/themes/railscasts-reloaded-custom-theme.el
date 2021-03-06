(deftheme railscasts-reloaded-custom
  "The awesome Railscasts theme")

(defvar railscasts-reloaded-custom-colors-alist
  `(("railscasts-bg"         . "#252525")
    ("railscasts-bgg"        . "#252525")
    ("railscasts-fg"         . "#E6E1DC")
    ("railscasts-fg-1"       . "#f0edea")
    ("railscasts-bg+1"       . "#161616")
    ("railscasts-bg-1"       . "#383838")
    ("railscasts-bg-2"       . "#4e4e4e")
    ("railscasts-brown"      . "#BC9357")
    ("railscasts-blue"       . "#6D9CBD")
    ("railscasts-green"      . "#A5C160")
    ("railscasts-dark-green" . "#509E50")
    ("railscasts-orange"     . "#CC7733")
    ("railscasts-yellow"     . "#FFC66D")
    ("railscasts-yellow-1"   . "#FFD798")
    ("railscasts-lilac"      . "#CFCFFF")
    ("railscasts-purple"     . "#4938da")
    ("railscasts-cyan"       . "#38c9da")
    ("railscasts-magenta"    . "#da3878")
    ("railscasts-red"        . "#DA4938")
    ("railscasts-red-1"      . "#e57f73")
    ("railscasts-white"      . "#FFFFFF")
    ("railscasts-black"      . "#000000")
    ("railscasts-silver"     . "#AAAAAA"))
  "List of colors used in Railscasts Reloaded.")


(defmacro railscasts-reloaded-with-color-variables (&rest body)
  "Bind the colors list around BODY."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@ (mapcar (lambda (cons)
                      (list (intern (car cons)) (cdr cons)))
                    railscasts-reloaded-custom-colors-alist))
     ,@body))

(railscasts-reloaded-with-color-variables

 (custom-theme-set-faces
  'railscasts-reloaded-custom

  `(default ((t (:foreground ,railscasts-fg :background ,railscasts-bg))))
  `(hl-line ((t (:background ,railscasts-bg-1))))
  `(region ((t (:background ,railscasts-bg-2))))
  `(highlight ((t (:background ,railscasts-black))))
  `(error ((t (:foreground ,railscasts-red-1))))
  `(minibuffer-prompt ((t (:foreground ,railscasts-yellow-1))))
  `(fringe ((t (:background ,railscasts-bg))))
  `(linum ((t (:foreground ,railscasts-bg-2))))

  ;;;; font-lock-faces
  `(font-lock-type-face ((t (:foreground ,railscasts-blue))))
  `(font-lock-builtin-face ((t (:foreground ,railscasts-cyan))))
  `(font-lock-constant-face ((t (:foreground ,railscasts-blue))))
  `(font-lock-string-face ((t (:foreground ,railscasts-green))))
  `(font-lock-keyword-face ((t (:foreground ,railscasts-orange))))
  `(font-lock-variable-name-face ((t (:foreground ,railscasts-lilac))))
  `(font-lock-function-name-face ((t (:foreground ,railscasts-yellow))))
  `(font-lock-comment-face ((t (:foreground ,railscasts-brown))))
  `(font-lock-comment-delimiter-face ((t (:foreground ,railscasts-brown))))
  `(font-lock-warning-face ((t (:foreground ,railscasts-yellow-1))))

  ;;;; package.el
  `(package-name ((t (:foreground ,railscasts-yellow))))
  `(package-status-installed ((t (:foreground ,railscasts-dark-green))))
  `(package-status-dependency ((t (:foreground ,railscasts-green))))
  `(package-status-built-in ((t (:foreground ,railscasts-red))))
  `(package-description ((t (:foreground ,railscasts-orange))))

  ;;;; modeline
  `(mode-line ((t (:background ,railscasts-black :foreground ,railscasts-silver))))
  `(mode-line-buffer-id ((t (:weight bold))))
  `(mode-line-emphasis ((t (:weight bold))))
  `(mode-line-inactive ((t (:background ,railscasts-bg-2))))

  ;;;; isearch
  `(isearch ((t (:foreground ,railscasts-magenta :background ,railscasts-bgg))))
  `(isearch-fail ((t (:foreground ,railscasts-fg :background ,railscasts-red))))
  `(lazy-highlight ((t (:foreground ,railscasts-bg :background ,railscasts-green))))

  ;;;; smartparens-mode
  `(sp-show-pair-mismatch-face ((t (:foreground ,railscasts-red-1 :background ,railscasts-black :weight bold))))
  `(sp-show-pair-match-face ((t (:background ,railscasts-black :weight bold))))

  ;;;; helm
  `(helm-header ((t (:foreground ,railscasts-blue
		     :background ,railscasts-bgg
		     :underline nil
		     :box (:line-width 1 :color ,railscasts-bg)))))
  `(helm-source-header ((t (:foreground ,railscasts-orange
			    :background ,railscasts-bgg
			    :underline t 
			    :weight bold
			    :box nil
			    ;;:box (:line-width 6 :style nil)
			    ))))
  `(helm-selection ((t (:background ,railscasts-bg-2))))
  `(helm-candidate-number ((t (:foreground ,railscasts-green :background ,railscasts-bg))))
  `(helm-ff-directory ((t (:foreground ,railscasts-blue :background ,railscasts-bgg :weight bold))))
  `(helm-ff-file ((t (:foreground ,railscasts-fg :background ,railscasts-bg :weight normal))))
  `(helm-ff-invalid-symlink ((t (:foreground ,railscasts-red-1 :background ,railscasts-bgg :weight bold))))
  `(helm-ff-executable ((t (:foreground ,railscasts-green :background ,railscasts-bg :weight normal))))
  `(helm-buffer-process ((t (:foreground ,railscasts-green))))
  `(helm-buffer-size ((t (:foreground ,railscasts-silver))))
  `(helm-match ((t (:foreground ,railscasts-green))))
  `(helm-grep-file ((t (:foreground ,railscasts-blue :background ,railscasts-bg))))
  `(helm-grep-finish ((t (:foreground ,railscasts-dark-green :background ,railscasts-bg))))
  `(helm-grep-lineno ((t (:foreground ,railscasts-red-1 :background ,railscasts-bg))))
  `(helm-grep-cmd-line ((t (:foreground ,railscasts-blue :background ,railscasts-bg))))
  `(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))

  ;;;; flycheck
  `(flycheck-info
    ((((supports :underline (:style line)))
      (:underline (:style line :color ,railscasts-dark-green) :inherit unspecified))
     (t (:foreground ,railscasts-dark-green :weight bold :underline t))))
  `(flycheck-fringe-info ((t (:foreground ,railscasts-dark-green :weight bold))))
  `(flycheck-warning
    ((((supports :underline (:style line)))
      (:underline (:style line :color ,railscasts-orange) :inherit unspecified))
     (t (:foreground ,railscasts-orange :weight bold :underline t))))


  ;;;; company
  `(company-tooltip ((t (:foreground ,railscasts-fg :background ,railscasts-bg-2))))
  `(company-tooltip-annotation ((t (:foreground ,railscasts-orange :background ,railscasts-bg-2))))
  `(company-tooltip-annotation-selection ((t (:foreground ,railscasts-orange :background ,railscasts-bg-1))))
  `(company-tooltip-selection ((t (:foreground ,railscasts-fg :background ,railscasts-bg-1))))
  `(company-tooltip-common ((t (:foreground ,railscasts-dark-green))))
  `(company-tooltip-common-selection ((t (:foreground ,railscasts-green))))
  `(company-tooltip-mouse ((t (:background ,railscasts-bg-1))))
  `(company-scrollbar-fg ((t (:background ,railscasts-fg))))
  `(company-scrollbar-bg ((t (:background ,railscasts-silver))))
  `(company-preview ((t (:background ,railscasts-green))))
  `(company-preview ((t (:foreground ,railscasts-green :background ,railscasts-bg-1))))

  ;;;; auto-complete
  `(ac-candidate-face ((t (:foreground ,railscasts-fg :background ,railscasts-bg-2 ))))
  `(ac-selection-face ((t ( :foreground ,railscasts-fg :background ,railscasts-orange))))

  ;;;; enh-ruby
  `(enh-ruby-op-face ((t (:foreground ,railscasts-yellow))))

  ;;;; erc
  `(erc-default-face ((t (:foreground ,railscasts-fg))))
  `(erc-keyword-face ((t (:foreground ,railscasts-blue :weight bold))))
  `(erc-nick-default-face ((t (:foreground ,railscasts-yellow :weight bold))))
  `(erc-current-nick-face ((t (:foreground ,railscasts-green :weight bold))))
  `(erc-nick-msg-face ((t (:inherit erc-default-face))))
  `(erc-notice-face ((t (:foreground ,railscasts-blue))))
  `(erc-prompt-face ((t (:foreground ,railscasts-orange :background ,railscasts-bg))))
  `(erc-timestamp-face ((t (:foreground ,railscasts-dark-green))))

  ;;;;; eshell
  `(eshell-prompt ((t (:foreground ,railscasts-yellow :weight bold))))

  ;;;;; js-2
  `(js2-object-property ((t (:foreground ,railscasts-red))))
  `(js2-function-call ((t (:foreground ,railscasts-blue))))

  ;;;;; rjsx
  `(rjsx-tag ((t (:foreground ,railscasts-magenta))))
  `(rjsx-attr ((t (:foreground ,railscasts-lilac))))
  `(rjsx-tag-bracket-face ((t (:foreground ,railscasts-fg-1))))

  ;;;;; magit
  `(magit-tag ((t (:foreground ,railscasts-yellow :weight bold))))
  ;;;;;; headings
  `(magit-section-heading ((t (:foreground ,railscasts-orange :weight bold))))
  ;;;;;; popup
  `(magit-popup-heading ((t (:foreground ,railscasts-orange :weight bold))))
  `(magit-popup-key ((t (:foreground ,railscasts-yellow :weight bold))))
  `(magit-popup-argument ((t (:foreground ,railscasts-green :weight bold))))
  `(magit-popup-disabled-argument ((t (:foreground ,railscasts-bg-2 :weight normal))))
  `(magit-popup-option-value ((t (:foreground ,railscasts-cyan :weight bold))))
  ;;;;;; log
  `(magit-log-author    ((t (:foreground ,railscasts-orange))))
  `(magit-log-date      ((t (:foreground ,railscasts-silver))))
  `(magit-log-graph     ((t (:foreground ,railscasts-bg-1))))
  ;;;;;; reflog
  `(magit-reflog-commit ((t (:foreground ,railscasts-dark-green))))
  `(magit-reflog-amend ((t (:foreground ,railscasts-magenta))))
  `(magit-reflog-reset ((t (:foreground ,railscasts-red))))
  `(magit-reflog-checkout ((t (:foreground ,railscasts-blue))))
  `(magit-reflog-other ((t (:foreground ,railscasts-cyan))))
  ;;;;;; references
  `(magit-branch-local ((t (:foreground ,railscasts-blue))))
  `(magit-branch-remote ((t (:foreground ,railscasts-dark-green))))
  `(magit-branch-current ((t (:foreground ,railscasts-cyan))))
  `(magit-signature-good      ((t (:foreground ,railscasts-green))))
  `(magit-signature-bad       ((t (:inherit error))))
  `(magit-signature-untrusted ((t (:foreground ,railscasts-yellow))))
  ;;;; blame
  `(magit-blame-heading ((t (:foreground ,railscasts-fg-1 :background ,railscasts-bg-1))))
  `(magit-blame-name ((t (:foreground ,railscasts-magenta :background ,railscasts-bg-1))))

  ;;;;; markdown-mode
  `(markdown-header-face ((t (:foreground ,railscasts-orange))))
  `(markdown-link-face ((t (:foreground ,railscasts-dark-green))))
  `(markdown-inline-code-face ((t (:foreground ,railscasts-blue))))
  `(markdown-pre-face ((t (:foreground ,railscasts-blue))))

  ;;;;; org-mode
  `(org-todo ((t (:foreground ,railscasts-red))))
  `(org-done ((t (:foreground ,railscasts-dark-green))))
  `(org-level-1 ((t (:foreground ,railscasts-orange :height 160))))
  `(org-level-2 ((t (:foreground ,railscasts-yellow :height 140))))
  `(org-level-3 ((t (:foreground ,railscasts-green))))
  `(org-level-4 ((t (:foreground ,railscasts-blue))))
  `(org-level-5 ((t (:foreground ,railscasts-lilac))))
  `(org-level-6 ((t (:foreground ,railscasts-red-1))))
  `(org-level-7 ((t (:foreground ,railscasts-cyan))))
  `(org-level-8 ((t (:foreground ,railscasts-white))))
  `(org-table ((t (:foreground ,railscasts-brown))))
  `(org-date ((t (:foreground ,railscasts-silver))))
  `(org-link ((t (:foreground ,railscasts-cyan))))
  `(org-tag ((t (:foreground ,railscasts-magenta))))
  ))

(railscasts-reloaded-with-color-variables
  (custom-theme-set-variables
   'railscasts-reloaded-custom
;;;;; fill-column-indicator
   `(fci-rule-color ,railscasts-bg-1)
   ))

;;;###autoload
(and load-file-name
    (boundp 'custom-theme-load-path)
    (add-to-list 'custom-theme-load-path
                 (file-name-as-directory
                  (file-name-directory load-file-name))))
;; Automatically add this theme to the load path

;;(set-background-color "#252525")
;;(set-face-attribute 'fringe nil
;;		    :foreground (face-foreground 'default)
;;		    :background (face-background 'default))
;;(set-face-foreground 'vertical-border "#252525")


;;(provide-theme 'railscasts-reloaded-custom)

;; Local Variables:
;; no-byte-compile: t
;; End:
;;; railscasts-reloaded-theme.el ends here
