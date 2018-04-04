;;; airline-doom-peacock --- Summary
;;; Commentary:
;;; Code:

(deftheme airline-doom-peacock
  "source https://github.com/hlissner/emacs-doom-themes/blob/master/themes/doom-peacock-theme.el")

(let* ((white        "#f8f8f0")
       (red          "#ff5d38")
       (dark-red     "#a60033")
       (orange       "#cb4b16")
       (yellow       "#f2dc5d")
       (bright-green "#bcd42a")
       (green        "#98be65")
       (blue         "#51afef")
       (teal         "#26a6a6")
       (violet       "#a9a1e1")
       (magenta      "#c678dd")
       (grey         "#23272e")
       (primary-foreground        white) (primary-background        grey)
       (active-foreground         "#1c1f24")
       (normal-outer-foreground   active-foreground)  (normal-outer-background  blue)
       (normal-inner-foreground   primary-foreground) (normal-inner-background  primary-background)
       (normal-center-foreground  primary-foreground) (normal-center-background primary-background)

       (insert-outer-foreground   active-foreground)  (insert-outer-background   bright-green)
       (insert-inner-foreground   primary-foreground) (insert-inner-background   primary-background)
       (insert-center-foreground  primary-foreground) (insert-center-background  primary-background)

       (visual-outer-foreground   active-foreground)  (visual-outer-background   yellow)
       (visual-inner-foreground   primary-foreground) (visual-inner-background   primary-background)
       (visual-center-foreground  primary-foreground) (visual-center-background  primary-background)

       (replace-outer-foreground  active-foreground)  (replace-outer-background  red)
       (replace-inner-foreground  primary-foreground) (replace-inner-background  primary-background)
       (replace-center-foreground primary-foreground) (replace-center-background primary-background)

       (emacs-outer-foreground    active-foreground)  (emacs-outer-background    magenta)
       (emacs-inner-foreground    primary-foreground) (emacs-inner-background    primary-background)
       (emacs-center-foreground   primary-foreground) (emacs-center-background   primary-background)

       (inactive1-foreground      "#5B6268") (inactive1-background      "#23272e")
       (inactive2-foreground      "#5B6268") (inactive2-background      "#23272e")
       (inactive3-foreground      "#5B6268") (inactive3-background      "#23272e"))

  (airline-themes-set-deftheme 'airline-doom-peacock)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  insert-outer-background
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background)))

(airline-themes-set-modeline)

(provide-theme 'airline-doom-peacock)
;;; airline-doom-peacock-theme.el ends here
