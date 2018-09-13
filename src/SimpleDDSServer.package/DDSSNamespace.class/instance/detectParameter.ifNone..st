accessing
detectParameter: aParameterName ifNone: aBlock
	" Detect parameters check in this namespace and in the parent namespace, iterating up to the root "

	^ parameters
		detect: [ :p | p name = aParameterName ]
		ifNone: [ 
			self isRoot
				ifTrue: aBlock
				ifFalse: [ parent detectParameter: aParameterName ifNone: aBlock ] ]