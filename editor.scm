;;module to edit a  local git repo and commit changes
;;todo include authentication

;;; gn-guile --- genenetwork markdown edit
;;; Copyright © 2022, 2023 Alex  Mwangi <alexanderkabua@gmail.com>
;;; Copyright © 2022, 2023 Frederick Muriuki Muriithi <fredmanglis@gmail.com>
;;;
;;; This file is part of gn-guile.

(use-modules (git)
	         (git object)
	)


(libgit2-init!)


;;(define repo_name (repository-open "."))  ;;getting repo nmae

(git-add)


#|
;;expected results are refs/heads/main
(define (get-reference-name repository-path)
  (let* ((repository (repository-open repository-path))
         (head-ref (repository-head repository))
         (reference-name (reference-name head-ref)))
    reference-name))

(define (commit-changes repo file-path message)
  ;; Open the Git index
  (define index (git-index-open repo))

  ;; Add the changes for the specified file to the index
  (git-index-add-file index file-path)

  ;; Write the updated index to disk
  (git-index-write-tree index)

  ;; Create a new Git commit
  (define author (git-signature-new "Your Name" "your.email@example.com"))
  (define committer (git-signature-new "Your Name" "your.email@example.com"))
  (define tree-id (git-index-write-tree index))
  (define parent-commit-id (git-reference-target (git-reference-lookup repo "HEAD")))
  (git-commit-create repo "HEAD" author committer "UTF-8" message tree-id parent-commit-id))


(display (get-reference-name "/home/kabui/myine/setup_automation_script/")) ; Replace with the actual path to your Git repository
|#




(libgit2-shutdown!)
