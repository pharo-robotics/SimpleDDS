actions
flatParameters
	" Flat parameters makes a dictionary parameterName => flatValue. This exists for ROS compatibility "

	^ parameters
		inject: Dictionary new
		into: [ :dic :p | 
			dic at: p name put: p value.
			dic ]