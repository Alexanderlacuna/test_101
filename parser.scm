(use-modules (commonmark)
             (commonmark sxml)
             (sxml simple)
             (web client)
             (web uri)
             (web request)
             (ice-9 receive)
             (ice-9 rdelim))


(define (read-file filename)
  "Return a string with the contents of FILENAME."
  (call-with-input-file filename
    (lambda (port)
      (peek-char port)    ; Peek to ensure we're at the beginning of the file
      (drain-input port))))  ; Read the entire content

(define (fetch-remote-file url)
  (receive (response-status response-body)
      (http-request url)
    response-body))


(define (write-xml-to-file file-name xml)
  (with-output-to-file file-name
    (lambda ()
      (sxml->xml xml))))

(define (convert-markdown-to-xml markdown-text output-filename)
  "Convert Markdown from MARKDOWN-TEXT to XML and save it to OUTPUT-FILENAME."
  (let ((markdown-parser (commonmark->sxml markdown-text)))
    (write-xml-to-file output-filename markdown-parser)))

