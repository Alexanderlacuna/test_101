
(use-modules (commonmark)
             (commonmark sxml)
             (sxml simple))
(define (read-file filename)
  "Return a string with the contents of FILENAME."
  (call-with-input-file filename
    (lambda (port)
      (peek-char port)    ; Peek to ensure we're at the beginning of the file
      (drain-input port))))  ; Read the entire content

(define (convert-markdown-to-xml input-filename output-filename)
  "Convert Markdown from INPUT-FILENAME to XML and save it to OUTPUT-FILENAME."
  (let ((markdown-text (read-file input-filename)))
    (let ((markdown-parser (commonmark->sxml markdown-text)))
      (write-xml-to-file output-filename markdown-parser))))


