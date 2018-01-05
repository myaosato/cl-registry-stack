(defpackage cl-registry-stack
  (:use :cl :asdf)
  (:export :add-path
           :remove-path
           :show-paths
           :swap-paths
           :push-paths
           :init
           :quit))
(in-package :cl-registry-stack)

(defvar *retracted-central-registry*)

(defvar *dev-registry* nil)

(defvar *dev-env-rc* (merge-pathnames #p".cl-registry-stack" (user-homedir-pathname)))

(defun retract ()
  (setf *retracted-central-registry* asdf:*central-registry*))

(defun save-env ()
  (with-open-file (out *dev-env-rc* :direction :output :if-exists :supersede)
    (print *dev-registry* out)))

(defun make-env ()
  (unless (probe-file *dev-env-rc*)
    (save-env)))

(defun load-env ()
  (with-open-file (in *dev-env-rc*)
    (setf *dev-registry* (read in))))

(defun add-path (path)
  (push path *dev-registry*)
  (save-env)
  (show-paths))

(defun remove-path (path)
  (setf *dev-registry* (delete path *dev-registry*))
  (save-env)
  (show-paths))

(defun show-paths ()
  (if *dev-registry*
      (let ((ind -1))
        (loop for path in *dev-registry*
              do (format t "~A: ~A~%" (incf ind) path)))
      (format t "no registered")))
  
(defun swap-paths (i j)
  (rotatef (nth i *dev-registry*) (nth j *dev-registry*))
  (save-env)
  (show-paths))

(defun push-paths ()
  (setf asdf:*central-registry* (append *dev-registry* *retracted-central-registry*)))

(defun pop-paths ()
  (setf asdf:*central-registry* *retracted-central-registry*))

(defun init ()
  (retract)
  (make-env)
  (load-env)
  (push-paths))

(defun quit ()
  (pop-paths))


