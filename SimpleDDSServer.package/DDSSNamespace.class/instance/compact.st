compact
compact
	namespaces valuesDo: #compact.
	self isRoot
		ifFalse: [ (parameters isEmpty and: [ namespaces isEmpty ])
				ifTrue: [ self delete ] ]