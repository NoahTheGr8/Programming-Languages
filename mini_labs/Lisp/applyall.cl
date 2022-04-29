;; applies function a to the first element of a list - this is the basis for applyall
;;(defun applyonce (a b)
;;  (cond ((null b) nil)
;;    (t (cons (funcall a (car b)) (cdr b))) ) )

;;Same as apply once but it applies the function to all the elements
(defun applyall (a b)
  (cond ((null b) nil)
    (t (cons (funcall a (car b)) (applyall a (cdr b)) ))
  )
)
