;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Andre de Oliveira"
      user-mail-address "andre@olivia.ai")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "JetBrainsMono" :size 16 :weight 'light))
(setq epg-gpg-program "gpg2")

(setq evil-surround-pairs-alist
  '((?\( . ("(" . " )"))
    (?\[ . ("[ " . " ]"))
    (?\{ . ("{ " . " }"))
    (?\) . ("(" . ")"))
    (?\] . ("[" . "]"))
    (?\} . ("{" . "}"))
    (?# . ("#{" . "}"))
    (?s . ("${" . "}"))
    (?b . ("(" . ")"))
    (?B . ("{" . "}"))
    (?> . ("<" . ">"))
    (?t . evil-surround-read-tag)
    (?< . evil-surround-read-tag)
    (?f . evil-surround-function)))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-henna)
(setq display-line-numbers-type 'relative)
; disable S-SPC (ivy-restrict-to-matches)
;    without this fix tryping space with shift pressed clears the input buffer while search for files
;
(after! ivy
  (define-key ivy-minibuffer-map (kbd "S-SPC") '(lambda () (interactive) (insert " ")))
  (define-key ivy-minibuffer-map (kbd "C-j") #'ivy-next-line)
  (define-key ivy-minibuffer-map (kbd "C-k") #'ivy-previous-line)
  (define-key evil-insert-state-map (kbd "C-j") #'ivy-next-line)
  (define-key evil-insert-state-map (kbd "C-k") #'ivy-previous-line)
  )

(defadvice! fix-lookup-handlers (ret)
  :filter-return '(+lsp-lookup-references-handler +lsp-lookup-definition-handler)
  (when ret 'deferred))
;; (setq custom-set-faces
;;   `(default :background "#000000" :bg-alt "#000000"))
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq display-line-numbers-type t)
(setq-hook! 'typescript-mode indent-tabs-mode t); typescript
(add-hook 'python-mode-hook 'anaconda-mode); anaconta-mode
(setq indent-tabs-mode t)
(setq dired-listing-switches "-alh --time-style \"+%m-%d-%Y %H:%M:%S\"")
; replace default rename symbol command
(map! (:leader (:prefix "c" :desc "Rename" "r" #'tide-rename-symbol)))
; other stuff
(setenv "GPG_AGENT_INFO" nil)
(map! "M-[" 'indium-debugger-step-over)
(map! "M-]" 'indium-debugger-step-into)
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#040408" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#bbc2cf"])
 '(custom-safe-themes
   (quote
    ("bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "e9d47d6d41e42a8313c81995a60b2af6588e9f01a1cf19ca42669a7ffd5c2fde" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "4e1ed90ce398e8ee296996da581e511ac358d2aeb44addb335a0b001a1746821" "3d3807f1070bb91a68d6638a708ee09e63c0825ad21809c87138e676a60bda5d" "3f5f69bfa958dcf04066ab2661eb2698252c0e40b8e61104e3162e341cee1eb9" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "9b272154fb77a926f52f2756ed5872877ad8d73d018a426d44c6083d1ed972b1" "687e997f50a47c647c5132f0671df27b8a3ff4f18e31210dc53abeaa7ea8cde3" "fe94e2e42ccaa9714dd0f83a5aa1efeef819e22c5774115a9984293af609fce7" "e2acbf379aa541e07373395b977a99c878c30f20c3761aac23e9223345526bcc" default)))
 '(doom-modeline-mode t)
 '(fci-rule-color "#5B6268")
 '(frame-brackground-mode (quote dark))
 '(hl-sexp-background-color "#33323e")
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#3f444a"))
 '(objed-cursor-color "#ff6c6b")
 '(package-selected-packages (quote (pinentry keychain-environment)))
 '(pdf-view-midnight-colors (cons "#bbc2cf" "#282c34"))
 '(rustic-ansi-faces
   ["#282c34" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#bbc2cf"])
 '(vc-annotate-background "#282c34")
 '(vc-annotate-color-map
   (list
    (cons 20 "#98be65")
    (cons 40 "#b4be6c")
    (cons 60 "#d0be73")
    (cons 80 "#ECBE7B")
    (cons 100 "#e6ab6a")
    (cons 120 "#e09859")
    (cons 140 "#da8548")
    (cons 160 "#d38079")
    (cons 180 "#cc7cab")
    (cons 200 "#c678dd")
    (cons 220 "#d974b7")
    (cons 240 "#ec7091")
    (cons 260 "#ff6c6b")
    (cons 280 "#cf6162")
    (cons 300 "#9f585a")
    (cons 320 "#6f4e52")
    (cons 340 "#5B6268")
    (cons 360 "#5B6268")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; (counsel-projectile-modify-action
;;  'counsel-projectile-switch-project-action
;;  '((default counsel-projectile-switch-project-action-vc)))
