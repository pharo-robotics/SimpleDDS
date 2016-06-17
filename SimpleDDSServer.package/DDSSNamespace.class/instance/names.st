accessing
names
	^ self isRoot
		ifTrue: [ parameters collect: #name ]
		ifFalse: [ parent names , parameters collect: #name ]