(use-modules (git)
	         (git object)
	         (system foreign)
	         (ice-9 textual-ports)
	)




;; need code to read the file
;; Read the existing content of the file
(define (read-file-content file-path)
  (with-input-from-file file-path
    (lambda ()
      (get-string-all))))


;; Write the modified content back to the file
(define (write-file-content file-path content)
  "Write content to a file."
  (with-output-to-file file-path
    (lambda ()
      (display content))))


;;repository open
;; Open the Git repository
(define (repos directory)  (repository-open  directory))

(define (fetch-repos-index repo) (repository-index repo))

(define (fetch-repo-index directory)
  (let* ((repo (repository-open directory))
         (index (repository-index repo)))
    index))



(define repo-name "/home,kabui/myine/setup_automation_script/")
(define x (repository-open "/home/kabui/myine/setup_automation_script/"))
(define index-pointer 0)


(define tw (scm->pointer 0))
(define w (make-pointer index-pointer))
(repository-index  tw   x)
;;(define test 1 )
;;(repository-index l1 x)
;;(define idx 0)
;;(repository-index idx  4 x)
;;(fetch-repos-index x)