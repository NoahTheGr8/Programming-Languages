;; Finds the volume of a circle given its radius

;;To run copy function into portacle then type "(volume-circle 5)" to call on function for a sphere with a radius of 5

(defun volume-circle(rad)
   (format t "~%Volume: ~10f" (* (/ 4 3) 3.141592 rad rad rad))
)
