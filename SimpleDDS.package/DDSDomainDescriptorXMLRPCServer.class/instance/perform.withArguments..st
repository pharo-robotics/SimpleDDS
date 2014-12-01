unimplemented
perform: aSelector withArguments: anArray
	| return |
	[ 
	return := {1.
	aSelector.
	(super perform: aSelector withArguments: anArray)} ]
		on: Error
		do: [ :e | 
			return := {0.
			(e messageText).
			(e messageText)} ].
	self haltIf: (return at: 3) == self.
	^ return