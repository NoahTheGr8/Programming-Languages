;;Computes exponentiation given a number and its power
(defun pow (n pow)
    (cond
        ((= pow 0) 1)
        (t
            (* n (pow n (- pow 1)))
        )
    )
)
