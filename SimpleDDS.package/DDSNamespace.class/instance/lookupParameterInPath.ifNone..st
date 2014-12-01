accessing
lookupParameterInPath: aParameterPath ifNone: aBlock
	self isRoot
		ifFalse: [ parent lookupPath: aParameterPath ].
	^ aParameterPath fetchFrom: self ifAbsent: aBlock