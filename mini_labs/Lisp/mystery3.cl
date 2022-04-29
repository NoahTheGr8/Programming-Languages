;;This program should be invoked by function 3c only - its purpose is to multiply any number by 4
(defun mystery3a (x) (* 2 x))
(defun mystery3b (a b) (funcall a (funcall a b)))
(defun mystery3c (y) (mystery3b `mystery3a y))
