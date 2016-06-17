as yet unclassified
testLookupFindServiceIfFoundIfNoneExecutesIfNone
	| val |
	val := false.
	domain findServiceByName: '/service' ifFound: [ val := false ] ifNone: [ val := true ].
	self assert: val