(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Hide toolbar with icons
(tool-bar-mode nil)
;; Hide scrollbar
(scroll-bar-mode nil)
;; Show battery status
(display-battery-mode t)
;; Show Time and mail
(display-time-mode t)
;; Show current column and line numbers
(column-number-mode t)
(line-number-mode t)



;; PHP-mode
;; (load "~/.emacs.d/php-mode")
;; (add-to-list 'auto-mode-alist '("\\.php[34]?\\'|\\.phtml\\'" . php-mode))
;; (add-to-list 'auto-mode-alist '("\\.module\\'" . php-mode))
;; (add-to-list 'auto-mode-alist '("\\.inc\\'" . php-mode))

;; Bison-modes
;; (load "~/.emacs.d/bison-mode")
;; (add-to-list 'auto-mode-alist '("\\.y\\'" . bison-mode))
;; (add-to-list 'auto-mode-alist '("\\.ypp\\'" . bison-mode))

;; C++-mode
;; Use c++-mode in *.h files by default.
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))

;; CS-mode (clearsilver lib)
;;(load "~/.emacs.d/cs-mode")
;; (add-to-list 'auto-mode-alist '("\\.cs\\'" . cs-mode))

;; Org-mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cb" 'org-iswitchb)


;; Use shortcut, to change current window
(windmove-default-keybindings 'meta)
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)
;;(org-export-define-backend 'html
;;  '(
;;    :options-alist
;;    '((:html-link-home "HTML_LINK_HOME" nil org-html-link-home)
;;      (:html-link-up "HTML_LINK_UP" nil org-html-link-up)
;;     )
;;   )
;;)

(setq org-publish-project-alist
      '(
	("dlugolecki-blog-org"
         :base-directory "~/prj/dlugolecki/dlugolecki.net.pl/blog"
         :base-extension "org"
         :html-extension "html"
         :publishing-directory "~/public_html/blog"
         :publishing-function org-html-publish-to-html
         :recursive t
	 :language "en"
	 :link-top "http://dlugolecki.net.pl/blog"
	 :link-home "http://dlugolecki.net.pl/"
	 )
        ("dlugolecki-static"
	 :base-directory "~/prj/dlugolecki/dlugolecki.net.pl"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|dsc\\|changes\\|gz\\|deb\\|htaccess"
         :publishing-directory "~/public_html"
         :publishing-function org-publish-attachment
         :recursive t
	 )
	("dlugolecki-org"
         :base-directory "~/prj/dlugolecki/dlugolecki.net.pl"
         :base-extension "org"
         :html-extension "html"
         :publishing-directory "~/public_html"
         :publishing-function org-html-publish-to-html
         :recursive t
	 :language "pl"
	 )

        ("dlugolecki"
	 :components ("dlugolecki-blog-org"
		      "dlugolecki-static"
		      "dlugolecki-org"))
))

(add-hook 'org-export-latex-after-blockquotes-hook
	  'org-export-latex-arrows)
(defun org-export-latex-arrows ()
  (goto-char (point-min))
  (while (search-forward "->" nil t)
    (org-if-unprotected
     (replace-match (org-export-latex-protect-string "$\\rightarrow$")
	  nil t))))
