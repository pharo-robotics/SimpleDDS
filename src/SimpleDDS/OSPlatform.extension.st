Extension { #name : #OSPlatform }

{ #category : #'*SimpleDDS' }
OSPlatform >> interfaces [
	self subclassResponsibility 
]

{ #category : #'*SimpleDDS' }
OSPlatform >> resolveIpInto: anInterface [
	self subclassResponsibility 
]
