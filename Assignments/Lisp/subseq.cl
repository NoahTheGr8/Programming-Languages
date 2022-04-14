;;checks if an element is a substring or not
(defun isExactMatch (x y)
  (cond ((and (null (car x)) (null (car y))) nil)
        ((null (car y)) t)
        ((= (car x) (car y)) isExactMatch( (cdr x) (cdr y)) )
  )
  nil
)

(defun subseq (a b)
  (cond ((null (car a)) nil)
        ((null (car y)) t)
        ((= (car a) (car b))
         (= (car a) (car b)) isExactMatch(a b))
  )
  (subseq((cdr a) (b)))
)
