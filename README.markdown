# Cl-Registry-Stack

WIP

## Usage

```
(ql:quickload :cl-registry-stack) 
;; or (asdf:load-system :cl-registry-stack) or other way to load this system

(cl-registry-stack:init)
;; make ~/.cl-registry-stack file when the file not exists.
;; read ~/.cl-registry-stack file to find pathnames 
;; (then this system know pathnames writen ~/.cl-registry-stack)
;; push pathnames to asdf:*central-registry*

(cl-registry-stack:add-path pathname)
;; add pathname to ~/.cl-registry-stack file

(cl-registry-stack:remove-path pathname)
;; remove pathname from ~/.cl-registry-stack file

(cl-registry-stack:show-paths)
;; show pathnames writen ~/.cl-registry-stack file

(cl-registry-stack:swap-paths index1 index2)
;; swap pathnames writen ~/.cl-registry-stack file
;; for example
;; (cl-registry-stack:show-path)
;; 0: ~/hoge/
;; 1: ~/piyo/
;; 2: ~/fuga/
;; (cl-registry-stack:swap-paths 0 2)
;; (cl-registry-stack:show-path)
;; 0: ~/fuga/
;; 1: ~/piyo/
;; 2: ~/hoge/

(cl-registry-stack:push-paths)
;; push pathnames writen ~/.cl-registry-stack file
;; for example
;; (cl-registry-stack:show-path)
;; 0: ~/hoge/
;; 1: ~/piyo/
;; 2: ~/fuga/
;; (cl-registry-stack:push-paths)
;; asdf:*central-registyr* -> (#p"~/hoge/" #p"~/piyo/" #p"~/fuga/" ...)

(cl-registry-stack:quit)
;; pop pathnames writen ~/.cl-registry-stack file from asdf:*central-registyr*
;; for example
;; asdf:*central-registyr* -> (#p"~/hogera/")
;; (cl-registry-stack:init)
;; (cl-registry-stack:push-paths)
;; asdf:*central-registyr* -> (#p"~/hoge/" #p"~/piyo/" #p"~/fuga/" #p"~/hogera/")
;; (cl-registry-stack:quit)
;; asdf:*central-registyr* -> (#p"~/hogera/")



```

## Installation

* using [roswell](https://github.com/roswell/roswell) (recomended)

```
ros install myaosato/cl-registry-stack

```

* clone this repositry (and add path for your Common Lisp (ASDF, Quicklisp) enviroment)

```
git clone https://github.com/myaosato/cl-registry-stack.git

```



