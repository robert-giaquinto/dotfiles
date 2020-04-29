(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("org" . "http://orgmode.org/elpa/")
        ("marmalade" . "http://marmalade-repo.org/packages/")))

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

(el-get 'sync)
(package-initialize)

;; Enable transient mark mode
(transient-mark-mode 1)


;; ORG-MODE
;; --------------------------------------
(require 'org);; Make Org mode work with files ending in .org
(require 'ox-latex)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "/Users/robert/Local/research/ensemble_normalizing_flows/org/tasks.org"
                             "/Users/robert/Local/research/ensemble_normalizing_flows/org/notes.org"
                             "~/org/*.org"
                             "/Users/robert/Local/research/org/"))

(add-hook 'org-mode-hook 'org-indent-mode)
(setq org-startup-indented t)
(setq org-hide-leading-stars t)
(setq org-todo-keywords '((sequence "TODO" "NEXT" "WAITING" "|" "DONE" "CANCELLED")))


;; LATEX
;; --------------------------------------
; (setq org-latex-create-formula-image-program 'dvipng)
; (setq org-latex-create-formula-image-program 'imagemagick)

;; My custom LaTeX class for Org-mode export. require is needed for it to work.
(add-to-list 'org-latex-classes
             '("myarticle"
"\\documentclass[a4paper,12pt]{article}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{geometry}
\\geometry{verbose,tmargin=2.5cm,bmargin=2.5cm,lmargin=2.5cm,rmargin=2.5cm}
\\usepackage{url}
\\usepackage{setspace}
\\usepackage{float}
\\usepackage{tikz}
\\usepackage{amsmath}
\\usepackage{enumerate}
\\usepackage{subfigure}
\\usepackage{booktabs}
\\usepackage[authoryear]{natbib}
\\usepackage[nottoc]{tocbibind}
\\usepackage{hyperref}
\\usepackage{graphicx}
\\usepackage{amssymb}
\\usepackage{amsmath}
\\usepackage{booktabs}
\\setcounter{secnumdepth}{3}
\\setcounter{tocdepth}{3}
"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}")
))


;; THEME
;; --------------------------------------
(toggle-frame-maximized)
;(toggle-frame-fullscreen)
(add-to-list 'custom-theme-load-path "~/.emacs.d/el-get/color-theme-sanityinc-tomorrow/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/el-get/intellij-theme/")

(add-to-list 'load-path "~/.emacs.d/elpa/neotree-20181121.2026")
(require 'neotree)
(global-set-key [C-tab] 'neotree-toggle)
(setq neo-theme 'classic)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq backward-delete-char-untabify-method 'hungry)

(global-linum-mode t)
(set-face-attribute 'linum nil :foreground "black" :background "white")

(setq inhibit-startup-message t)
(require 'paren)
(show-paren-mode t)
(set-default 'truncate-lines t)
(setq require-final-newline t)

(ido-mode 1)
(setq ido-separator "\n")


(defun insert-underscore ()
  "Guess what!"
  (interactive)
  (insert "_"))
; (define-key global-map [(shift space)] (insert "_"))
(global-set-key (kbd "S-SPC") 'insert-underscore)
;(defun python-remap-underscore ()
;  (define-key python-mode-map [(shift space)] 'insert-underscore))
;(add-hook 'python-mode-hook 'python-remap-underscore)



;; PYTHON CONFIGURATION
;; --------------------------------------
(elpy-enable)
(setq elpy-rpc-backend "jedi")
(setq eldoc-idle-delay 1)  ;; in seconds

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(add-hook 'python-mode-hook 'flycheck-mode)

(add-hook 'python-mode-hook
      (lambda ()
        (setq indent-tabs-mode nil)
        (setq tab-width 4)
        (setq python-indent-offset 4)))





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(beacon-color "#c82829")
 '(custom-enabled-themes (quote (doom-vibrant)))
 '(custom-safe-themes
   (quote
    ("fa3bdd59ea708164e7821574822ab82a3c51e262d419df941f26d64d015c90ee" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "02591317120fb1d02f8eb4ad48831823a7926113fa9ecfb5a59742420de206e0" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(ensime-sem-high-faces
   (quote
    ((var :foreground "#000000" :underline
          (:style wave :color "yellow"))
     (val :foreground "#000000")
     (varField :foreground "#600e7a" :slant italic)
     (valField :foreground "#600e7a" :slant italic)
     (functionCall :foreground "#000000" :slant italic)
     (implicitConversion :underline
                         (:color "#c0c0c0"))
     (implicitParams :underline
                     (:color "#c0c0c0"))
     (operator :foreground "#000080")
     (param :foreground "#000000")
     (class :foreground "#20999d")
     (trait :foreground "#20999d" :slant italic)
     (object :foreground "#5974ab" :slant italic)
     (package :foreground "#000000")
     (deprecated :strike-through "#000000"))))
 '(fci-rule-color "#d6d6d6")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(frame-background-mode (quote light))
 '(org-agenda-files
   (quote
    ("~/Local/research/ensemble_normalizing_flows/org/notes.org" "~/Local/research/ensemble_normalizing_flows/org/tasks.org")))
 '(org-format-latex-options
   (quote
    (:foreground "Black" :background default :scale 1.25 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\["))))
 '(org-startup-with-latex-preview t)
 '(package-selected-packages
   (quote
    (doom-themes all-the-icons-ibuffer highlight-indent-guides highlight-indentation neotree theme-changer elpa-mirror ## sublimity sublime-themes seq py-autopep8 material-theme leuven-theme let-alist elpy ein better-defaults apropospriate-theme anti-zenburn-theme)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#c82829")
     (40 . "#f5871f")
     (60 . "#eab700")
     (80 . "#718c00")
     (100 . "#3e999f")
     (120 . "#4271ae")
     (140 . "#8959a8")
     (160 . "#c82829")
     (180 . "#f5871f")
     (200 . "#eab700")
     (220 . "#718c00")
     (240 . "#3e999f")
     (260 . "#4271ae")
     (280 . "#8959a8")
     (300 . "#c82829")
     (320 . "#f5871f")
     (340 . "#eab700")
     (360 . "#718c00"))))
 '(vc-annotate-very-old-color nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(col-highlight ((t (:background "color-233"))))
 '(hl-line ((t (:background "color-233"))))
 '(lazy-highlight ((t (:background "black" :foreground "white" :underline t))))
 '(neo-dir-link-face ((t (:foreground "#6699cc"))))
 '(neo-file-link-face ((t (:foreground "#cccccc"))))
 '(neo-root-dir-face ((t (:foreground "#8D8D84")))))


