accessing
compact
	namespaces values do: #compact.
	self isRoot
		ifFalse: [ 
			(parameters isEmpty and: [ namespaces isEmpty ])
				ifTrue: [ self delete ] ]