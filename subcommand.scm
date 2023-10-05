(use-modules (rnrs) (system foreign) (ice-9 format) (srfi srfi-1))

(define (run-command command)
  (let* ((process (make-forkprocess
                    #:search-path #t
                    #:program "git"
                    #:arguments (list "sh" "-c" command)
                    #:input #f))
         (output (make-string 1024)))
    (read-string! (forkprocess-output process) output)
    (wait-process process)
    output))

(define (git-add-and-commit repository file message)
  (let* ((add-command (format #f "cd ~a && git add ~a" repository file))
         (commit-command (format #f "cd ~a && git commit -m ~a" repository message)))
    (run-command add-command)
    (run-command commit-command)))

(define repo-path "/path/to/your/repo")
(define file-to-commit "path/to/your/file.txt")
(define commit-message "Your commit message here")

(git-add-and-commit repo-path file-to-commit commit-message)
