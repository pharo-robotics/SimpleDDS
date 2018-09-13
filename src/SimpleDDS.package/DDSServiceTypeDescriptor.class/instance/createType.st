as yet unclassified
createType
	^ (self isUnknown or: [ self isUndefined ])
		ifTrue: [ domain createTypePlaceHolder: name asString ]
		ifFalse:
			[ domain createServiceTypeNamed: name asString definedBy: self definition ]