(defun subseq (a b)
  (cond ((null b) nil);;look into alterative languages that can do this recursively
    (t (cons (funcall a (car b)) (applyall a (cdr b)) ))
  )
)
