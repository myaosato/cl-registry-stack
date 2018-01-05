#|
  This file is a part of dev-env project.
|#

(defsystem "cl-registry-stack"
  :version "0.1.0"
  :author "Satoaki MIYAO"
  :license "MIT"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "cl-dev-env"))))
  :description "push paths to asdf:*central-registry*"
  :long-description
  #.(read-file-string
     (subpathname *load-pathname* "README.markdown")))
