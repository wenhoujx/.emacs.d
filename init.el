

;; add packages
(add-to-list 'load-path "~/.emacs.d/lisp")


(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/")
      package-archives )
(push '("melpa" . "http://melpa.milkbox.net/packages/")
      package-archives )






(package-initialize)
(load-theme 'misterioso t)


(load-library "secrets.el.gpg")
(provide 'secrets)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-mode
(require 'org)
;; The following lines are always needed. Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode)) ; not needed since Emacs 22.2
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)


;; (custom-set-variables
;;   ;; custom-set-variables was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(auto-raise-tool-bar-buttons t t)
;;  '(auto-resize-tool-bars t t)
;;  '(calendar-week-start-day 1)
;;  '(case-fold-search t)
;;  '(current-language-environment "Latin-1")
;;  '(default-input-method "latin-1-prefix")
;;  '(normal-erase-is-backspace t)
;;  '(org-agenda-files (quote ("$HOME/org/birthday.org" "$HOME/org/newgtd.org")))
;;  '(org-agenda-ndays 7)
;;  '(org-agenda-repeating-timestamp-show-all nil)
;;  '(org-agenda-restore-windows-after-quit t)
;;  '(org-agenda-show-all-dates t)
;;  '(org-agenda-skip-deadline-if-done t)
;;  '(org-agenda-skip-scheduled-if-done t)
;;  '(org-agenda-sorting-strategy (quote ((agenda time-up priority-down tag-up) (todo tag-up))))
;;  '(org-agenda-start-on-weekday nil)
;;  '(org-agenda-todo-ignore-deadlines t)
;;  '(org-agenda-todo-ignore-scheduled t)
;;  '(org-agenda-todo-ignore-with-date t)
;;  '(org-agenda-window-setup (quote other-window))
;;  '(org-deadline-warning-days 7)
;;  '(org-export-html-style "<link rel=\"stylesheet\" type=\"text/css\" href=\"mystyles.css\">")
;;  '(org-fast-tag-selection-single-key nil)
;;  '(org-log-done (quote (done)))
;;  '(org-refile-targets (quote (("newgtd.org" :maxlevel . 1) ("someday.org" :level . 2))))
;;  '(org-reverse-note-order nil)
;;  '(org-tags-column -78)
;;  '(org-tags-match-list-sublevels nil)
;;  '(org-time-stamp-rounding-minutes 5)
;;  '(org-use-fast-todo-selection t)
;;  '(org-use-tag-inheritance nil)
;; )


;; Highlight text chosen in with Mark region
(transient-mark-mode t)

(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; (setq org-log-done nil)
;; (setq org-agenda-include-diary nil)
;; (setq org-deadline-warning-days 7)
;; (setq org-timeline-show-empty-dates t)
;; (setq org-insert-mode-line-in-empty-file t)
;; (setq org-default-notes-file (concat org-directory "/notes.org"))


(define-key global-map "\C-cc" 'org-capture)


(setq org-directory "~/org/")
(setq org-default-notes-file "~/.notes")
;; (setq remember-annotation-functions '(org-remember-annotation))
;; (setq remember-handler-functions '(org-remember-handler))
;; (add-hook 'remember-mode-hook 'org-remember-apply-template)


(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
	 "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
	 "* %?\nEntered on %U\n  %i\n  %a")))


;; (define-key global-map [f8] 'remember)
;; (define-key global-map [f9] 'remember-region)

;; (setq org-agenda-exporter-settings
;;       '((ps-number-of-columns 1)
;;         (ps-landscape-mode t)
;;         (htmlize-output-type 'css)))

;; (setq org-agenda-custom-commands
;; '(

;; ("P" "Projects"   
;; ((tags "PROJECT")))

;; ("H" "Office and Home Lists"
;;      ((agenda)
;;           (tags-todo "OFFICE")
;;           (tags-todo "HOME")
;;           (tags-todo "COMPUTER")
;;           (tags-todo "DVD")
;;           (tags-todo "READING")))

;; ("D" "Daily Action List"
;;      (
;;           (agenda "" ((org-agenda-ndays 1)
;;                       (org-agenda-sorting-strategy
;;                        (quote ((agenda time-up priority-down tag-up) )))
;;                       (org-deadline-warning-days 0)
;;                       ))))
;; )
;; )

;; (defun gtd ()
;;     (interactive)
;;     (find-file "c:/charles/gtd/newgtd.org")
;; )
;; (global-set-key (kbd "C-c g") 'gtd)


;; (add-hook 'org-agenda-mode-hook 'hl-line-mode)

; org mode start - added 20 Feb 2006
;; The following lines are always needed. Choose your own keys.




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

(set-variable 'confirm-kill-emacs 'yes-or-no-p)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; update packages
(when (not package-archive-contents)
  (package-refresh-contents))

;; windmove
(windmove-default-keybindings 'meta)


;; emacs bash completion
(require 'bash-completion)
(bash-completion-setup)
(autoload 'bash-completion-dynamic-complete
  "bash-completion"
  "BASH completion hook")
(add-hook 'shell-dynamic-complete-functions
          'bash-completion-dynamic-complete)
(add-hook 'shell-command-complete-functions
          'bash-completion-dynamic-complete)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))


(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))


(setq helm-split-window-in-side-p           t ; open helm buffer
                                        ; inside current window,
                                        ; not occupy whole other
                                        ; window
      helm-move-to-line-cycle-in-source     t ; move to end or
                                        ; beginning of source
                                        ; when reaching top or
                                        ; bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in
                                        ; `require' and
                                        ; `declare-function'
                                        ; sexp.
      helm-scroll-amount 8 ; scroll 8 lines other window using M-<next>/M-<prior> 
      helm-ff-file-name-history-use-recentf t)

(helm-mode 1)

(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

(helm-autoresize-mode t)
(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)



(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)



(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(global-set-key "\M-\r" 'shell-resync-dirs)


;; ;; recently opened files
;; (require 'recentf)
;; (recentf-mode 1)
;; (setq recentf-max-menu-items 25)
;; (global-set-key "\C-x\ \C-r" 'recentf-open-files)



                                        ; Set cursor color to yellow, yellow is good.
(set-cursor-color "#ffff00")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ; auctex setting
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

;; (load "preview-latex.el" nil t t)
(setq reftex-plug-into-auctex t)

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'remove-dos-eol)
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'auto-complete-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'auto-complete)
(global-auto-complete-mode t)
(auto-complete-mode t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; marcos, in the side by side window, issue its latest command
;; use insert-named-macro
(fset 'issue-last-command-in-the-shell-in-another-window
      [?\C-x ?\C-s ?\C-x ?o ?\M-p return ?\C-x ?o])

(global-set-key (kbd "C-c s") 'issue-last-command-in-the-shell-in-another-window)

(fset 'issue-ipython
      [?\C-x ?o ?c ?p ?a ?s ?t ?e ?  ?\C-m ?\C-y ?\C-m ?- ?- ?\C-m ?\C-x ?o])



(defun issue-ipython-region-or-line ()
  "cpaste python script of the region or the current line if
there's no active region. to the ipython already open in another window"
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (progn (copy-region-as-kill beg end)
           (execute-kbd-macro (symbol-function 'issue-ipython))
           )))


;; (defun issue-ipython-region-or-line ()
;;     "cpaste python script of the region or the current line if
;; there's no active region. to the ipython already open in another window"
;;     (interactive)
;;     (let (beg end)
;;         (if (region-active-p)
;;             (setq beg (region-beginning) end (region-end))
;;             (setq beg (line-beginning-position) end (line-end-position)))
;;         (progn (copy-region-as-kill beg end)
;;             (other-window 1)
;;             (insert "cpaste")
;;             (comint-send-input)
;;             (sit-for 1)
;;             (yank 1)
;;             (comint-send-input)
;;             (insert "--")
;;             (comint-send-input)
;;             (other-window 1)
;;             )))

(global-set-key (kbd "C-c i") 'issue-ipython-region-or-line)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set comments
(defun toggle-comment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

;; now a new better way to comment.
(global-set-key (kbd "M-;") 'toggle-comment-region-or-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; used for virtualenv get recognized ?
;; exec path from shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; tramps because entering a very long file name can cause an error
(put 'temporary-file-directory 'standard-value '((file-name-as-directory "/tmp")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; line number
(global-linum-mode t)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; remov the ^M in some files
(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; jabber
(setq jabber-account-list
      '(("wenhoujx@gmail.com"
         ;; (:password . (rest (assoc :mbox1 password-alist)))
         (:network-server . "talk.google.com")
         (:connection-type . ssl)
         (:port . 443))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; gmail-message-mode
(require 'edit-server)
(edit-server-start)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; markdown mode
(autoload 'markdown-mode "markdown-mode" "Major mode for editing
 Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; password protection
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; browsing in emacs
;;change default browser for 'browse-url'  to w3m
(setq browse-url-browser-function 'w3m-goto-url-new-session)

;; ;;change w3m user-agent to android
;; (setq w3m-user-agent "Mozilla/5.0 (Linux; U; Android 2.3.3; zh-tw; HTC_Pyramid Build/GRI40) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.")

;; ;;quick access hacker news
;; (defun hn ()
;;   (interactive)
;;   (browse-url "http://news.ycombinator.com"))

;;quick access reddit
(defun reddit (reddit)
  "Opens the REDDIT in w3m-new-session"
  (interactive (list
                (read-string "Enter the reddit (default: news): " nil nil "news" nil)))
  (browse-url (format "http://m.reddit.com/r/%s" reddit))
  )


;;i need this often
(defun wikipedia-search (search-term)
  "Search for SEARCH-TERM on wikipedia"
  (interactive
   (let ((term (if mark-active
                   (buffer-substring (region-beginning) (region-end))
                 (word-at-point))))
     (list
      (read-string
       (format "Wikipedia (%s):" term) nil nil term)))
   )
  (browse-url
   (concat
    "http://en.m.wikipedia.org/w/index.php?search="
    search-term
    ))
  )

;;when I want to enter the web address all by hand
(defun w3m-open-site (site)
  "Opens site in new w3m session with 'http://' appended"
  (interactive
   (list (read-string "Enter website address(default: w3m-home):" nil nil w3m-home-page nil )))
  (w3m-goto-url-new-session
   (concat "http://" site)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; reopen the file with sudo
(defun sudo-edit (&optional arg)
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))



;; ;; for remote bash
;; (setq shell-file-name "bash")
;; (setq shell-command-switch "-ic")



;; (eval-after-load "python" '(define-key inferior-python-mode-map "\t" 'python-shell-completion-complete-or-indent))


;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)

;; auto sync shell path
;; (add-hook 'shell-mode-hook
;;         #'(lambda ()
;;             (shell-dirtrack-mode nil)
;;             (add-hook 'comint-preoutput-filter-functions
;;                       'shell-sync-dir-with-prompt nil t)))

;; elpy package
(require 'package)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))


;; (defun elpy-shell-send-region-or-buffer (&optional arg)
;;   "Send the active region or the buffer to the Python shell.

;; If there is an active region, send that. Otherwise, send the
;; whole buffer.

;; Without prefix argument, this will escape the Python idiom of
;; if __name__ == '__main__' to be false to avoid accidental
;; execution of code. With prefix argument, this code is executed."
;;   (interactive "P")
;;   ;; Ensure process exists
;;   (elpy-shell-get-or-create-process)
;;   (if (region-active-p)
;;       (python-shell-send-string (elpy--region-without-indentation
;;                                  (region-beginning) (region-end)))
;;     (python-shell-send-buffer arg))
;;   (elpy-shell-switch-to-shell))


(elpy-enable)
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
(define-key global-map (kbd "C-c o") 'iedit-mode)

(elpy-use-ipython)


;; use jedi as the auto completion and leave rope installed
(setq elpy-rpc-backend "jedi")



;; I am not using this smartparens package because it is not useful
;; ;; smart parens
;; (package-initialize)
;; (smartparens-global-mode t)


;; thesaurus.el setup
(require 'thesaurus)
(setq thesaurus-bhl-api-key "9938ccdb9abfd21354398af9c1bec4e7")  ;; from registration
;; optional key binding
(define-key global-map (kbd "C-x t") 'thesaurus-choose-synonym-and-replace)

;; -------------------------------------------------------
(defun indent-buffer ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))

(defun untabify-buffer ()
  "Untabify current buffer"
  (interactive)
  (untabify (point-min) (point-max)))

(defun cleanup-buffer-safe ()
  "Perform a bunch of safe operations on the whitespace content of a buffer.
Does not indent buffer, because it is used for a before-save-hook, and that
might be bad."
  (interactive)
  (untabify-buffer)
  (delete-trailing-whitespace)
  (set-buffer-file-coding-system 'utf-8))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer.
Including indent-buffer, which should not be called automatically on save."
  (interactive)
  (cleanup-buffer-safe)
  (indent-buffer))

(global-set-key (kbd "C-c n") 'cleanup-buffer)


;; -------------------------------------------------------
;; Magit rules!
(global-set-key (kbd "C-x g") 'magit-status)


;; -------------------------------------------------------
;; Start a regular shell if you prefer that.
(global-set-key (kbd "C-x M-m") 'shell)
;; -------------------------------------------------------
(global-set-key [(C-f5)] 'compile)
(global-set-key [(f5)] 'recompile)
