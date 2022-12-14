;; See http://www.unicode.org/charts/

(define-translation-table 'sb-normal-to-subscript '((?0 . ?₀)
						    (?1 . ?₁)
						    (?2 . ?₂)
						    (?3 . ?₃)
						    (?4 . ?₄)
						    (?5 . ?₅)
						    (?6 . ?₆)
						    (?7 . ?₇)
						    (?8 . ?₈)
						    (?9 . ?₉)
						    (?a . ?ₐ)
						    (?e . ?ₑ)
						    (?h . ?ₕ)
						    (?i . ?ᵢ)
						    (?j . ?ⱼ)
						    (?k . ?ₖ)
						    (?l . ?ₗ)
						    (?m . ?ₘ)
						    (?n . ?ₙ)
						    (?o . ?ₒ)
						    (?p . ?ₚ)
						    (?r . ?ᵣ)
						    (?s . ?ₛ)
						    (?t . ?ₜ)
						    (?u . ?ᵤ)
						    (?v . ?ᵥ)
						    (?x . ?ₓ)
						    (?β . ?ᵦ)
						    (?γ . ?ᵧ)
						    (?ρ . ?ᵨ)
						    (?φ . ?ᵩ)
						    (?χ . ?ᵪ)))

(define-translation-table 'sb-normal-to-superscript '((?0 . ?⁰)
						      (?1 . ?¹)
						      (?2 . ?²)
						      (?3 . ?³)
						      (?4 . ?⁴)
						      (?5 . ?⁵)
						      (?6 . ?⁶)
						      (?7 . ?⁷)
						      (?8 . ?⁸)
						      (?9 . ?⁹)
						      (?a . ?ᵃ)
						      (?b . ?ᵇ)
						      (?c . ?ᶜ)
						      (?d . ?ᵈ)
						      (?e . ?ᵉ)
						      (?f . ?ᶠ)
						      (?g . ?ᵍ)
						      (?h . ?ʰ)
						      (?i . ?ⁱ)
						      (?j . ?ʲ)
						      (?k . ?ᵏ)
						      (?l . ?ˡ)
						      (?m . ?ᵐ)
						      (?n . ?ⁿ)
						      (?o . ?ᵒ)
						      (?p . ?ᵖ)
						      (?r . ?ʳ)
						      (?s . ?ˢ)
						      (?t . ?ᵗ)
						      (?u . ?ᵘ)
						      (?v . ?ᵛ)
						      (?w . ?ʷ)
						      (?x . ?ˣ)
						      (?y . ?ʸ)
						      (?z . ?ᶻ)))

;;(define-translation-table 'font-styles-to-bold font-styles--normal-to-bold)

(setq font-styles--all-styles (split-string (f-read-text "utf8-font-styles.csv") "\n+"))

(defun font-styles--all-styles-extract-column (index)
  (mapcar (lambda (s) (cons (aref s 0) (aref s index))) font-styles--all-styles))

(defun font-styles--merge-style-tables (left right)
  (mapcar (lambda (c) (cons (cdr (assoc c left))
			    (cdr (assoc c right))))
	  font-styles--normal))

(defun font-styles--invert-table (table)
  (mapcar (lambda (x) (cons (cdr x) (car x))) table))

(setq font-styles--normal (mapcar (lambda (s) (aref s 0)) font-styles--all-styles))

(load-file "utf8-font-styles-normal-to-bold.el")
(load-file "utf8-font-styles-normal-to-italic.el")
(load-file "utf8-font-styles-normal-to-bold-italic.el")
(load-file "utf8-font-styles-normal-to-script.el")
(load-file "utf8-font-styles-normal-to-bold-script.el")
(load-file "utf8-font-styles-normal-to-fraktur.el")
(load-file "utf8-font-styles-normal-to-bold-fraktur.el")
(load-file "utf8-font-styles-normal-to-double-struck.el")
(load-file "utf8-font-styles-normal-to-sans-serif.el")
(load-file "utf8-font-styles-normal-to-bold-sans-serif.el")
(load-file "utf8-font-styles-normal-to-italic-sans-serif.el")
(load-file "utf8-font-styles-normal-to-bold-italic-sans-serif.el")
(load-file "utf8-font-styles-normal-to-monospace.el")

;; (setq font-styles--bold-to-normal
;;       (font-styles--invert-table utf8-font-styles--normal-to-bold))

;; (setq font-styles--bold-to-bold-italic
;;       (font-styles--merge-style-tables utf8-font-styles--normal-to-bold
;; 				       font-styles--normal-to-bold-italic))

;; (setq font-styles--italic-to-normal
;;       (font-styles--invert-table font-styles--normal-to-italic))

;; (setq font-styles--italic-to-bold-italic
;;       (font-styles--merge-style-tables font-styles--normal-to-italic
;; 				       font-styles--normal-to-bold-italic))

;; (setq font-styles--bold-italic-to-normal
;;       (font-styles--invert-table font-styles--normal-to-bold-italic))

;; (setq font-styles--bold-italic-to-bold
;;       (font-styles--invert-table font-styles--bold-to-bold-italic))

;; (setq font-styles--bold-italic-to-italic
;;       (font-styles--invert-table font-styles--italic-to-bold-italic))

;; (setq font-styles--script-to-normal
;;       (font-styles--invert-table font-styles--normal-to-script))

;; (define-translation-table 'font-styles-to-normal
;;   (append font-styles--bold-to-normal
;; 	  font-styles--italic-to-normal
;; 	  font-styles--bold-italic-to-normal))

(define-translation-table 'utf8-font-styles-to-bold
  (append utf8-font-styles--normal-to-bold
	  ;font-styles--italic-to-bold-italic
	  ;font-styles--bold-italic-to-italic)
  ))

(define-translation-table 'utf8-font-styles-to-italic
  (append utf8-font-styles--normal-to-italic
	  ;font-styles--bold-to-bold-italic
	  ;font-styles--bold-italic-to-bold
	  ))

(define-translation-table 'utf8-font-styles-to-bold-italic
  (append utf8-font-styles--normal-to-bold-italic
	  ;; font-styles--bold-to-bold-italic
	  ;; font-styles--italic-to-bold-italic
	  ))

(define-translation-table 'utf8-font-styles-to-script
  utf8-font-styles--normal-to-script)

(define-translation-table 'utf8-font-styles-to-bold-script
  utf8-font-styles--normal-to-bold-script)

(define-translation-table 'utf8-font-styles-to-fraktur
  utf8-font-styles--normal-to-fraktur)

(define-translation-table 'utf8-font-styles-to-bold-fraktur
  utf8-font-styles--normal-to-bold-fraktur)

(define-translation-table 'utf8-font-styles-to-double-struck
  utf8-font-styles--normal-to-double-struck)

(define-translation-table 'utf8-font-styles-to-sans-serif
  utf8-font-styles--normal-to-sans-serif)

(define-translation-table 'utf8-font-styles-to-bold-sans-serif
  utf8-font-styles--normal-to-bold-sans-serif)

(define-translation-table 'utf8-font-styles-to-italic-sans-serif
  utf8-font-styles--normal-to-italic-sans-serif)

(define-translation-table 'utf8-font-styles-to-bold-italic-sans-serif
  utf8-font-styles--normal-to-bold-italic-sans-serif)

(define-translation-table 'utf8-font-styles-to-monospace
  utf8-font-styles--normal-to-monospace)


;; (defun sb-replace-preceding-char (replacements)
;;   (interactive)
;;   (let ((c (preceding-char)))
;;     (delete-backward-char 1)
;;     (insert (alist-get c replacements c))))

;; (defun sb-to-superscript ()
;;   (interactive)
;;   (sb-replace-preceding-char sb-superscript-map))

;; (defun sb-to-subscript ()
;;   (interactive)
;;   (sb-replace-preceding-char sb-subscript-map))

;; (global-set-key (kbd "<S-up>") #'sb-to-superscript)
;; (global-set-key (kbd "<S-down>") #'sb-to-subscript)

;; (defun sb-change-font-style-region ()
;;   (interactive)

;;(mapcar (lambda (pair) (cons (cdr pair) (car pair))) sb-subscript-map)
