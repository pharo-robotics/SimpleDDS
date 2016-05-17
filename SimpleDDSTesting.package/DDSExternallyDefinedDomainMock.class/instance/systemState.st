as yet unclassified
systemState
	disconnectedMirror ifTrue: [ ConnectionTimedOut new signal ].
	^ systemState value