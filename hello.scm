(define-module (hello-nomike)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (gnu packages cmake))

(define-public hello-nomike
  (package
    (name "hello-nomike")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "file:///home/nomike/coding/hello-nomike")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000")))) ; Replace with actual hash
    (build-system cmake-build-system)
    (inputs
     `(("cmake" ,cmake)))
    (synopsis "Simple program that greets nomike")
    (description "This package provides a simple C++ program that prints 'Hello nomike!' to the console.")
    (home-page "https://github.com/your-username/hello-nomike")
    (license #f))) ; Specify license if needed

hello-nomike
