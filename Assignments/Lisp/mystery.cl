;;Calculates the length of a list recursively
(defun mystery0 (x)
  (cond ((null x) 0)
    (t (+ 1 (mystery0 (cdr x)))) ) )
