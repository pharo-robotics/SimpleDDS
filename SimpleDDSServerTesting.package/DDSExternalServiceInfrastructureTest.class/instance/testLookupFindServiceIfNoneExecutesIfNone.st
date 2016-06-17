as yet unclassified
testLookupFindServiceIfNoneExecutesIfNone
	| val |
	val := false.
	domain findServiceByName: '/service' ifNone: [ val := true ].
	self assert: val