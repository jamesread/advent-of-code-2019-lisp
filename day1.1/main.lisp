#!/usr/bin/sbcl --script

; functions
(defun get-fuel-needed (mass)
	(- (floor (/ mass 3)) 2)
)

; asserts based on examples (cheap unit test, aherm)
(assert (= 2 (get-fuel-needed 12)))
(assert (= 2 (get-fuel-needed 14)))
(assert (= 654 (get-fuel-needed 1969)))
(assert (= 33583 (get-fuel-needed 100756)))

; Now build a running total of fuel based on the masses defined in the input
(defvar total-fuel-needed 0)

(let ((in (open "input" :if-does-not-exist nil)))
	(when in
	  	(loop for line = (read-line in nil) while line do 
			(incf total-fuel-needed (get-fuel-needed (parse-integer line)))
		)
		(close in)
	)
)

; Result
(format t "Total fuel needed: ~a~%" total-fuel-needed)
