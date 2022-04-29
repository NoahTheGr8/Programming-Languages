;;This function removes an element a from a list b
(defun mystery2 (a b)
  (cond ((null b) nil)
    ((eq a (car b)) (mystery2 a (cdr b)))
    (t (cons (car b) (mystery2 a (cdr b))))
  )
)
