as yet unclassified
testLookupFindServiceIfFoundIfNoneExecutesIfFound
	| val |
	val := false.
	domain findOrRegisterServiceByName: '/service'.
	domain
		findServiceByName: '/service'
		ifFound: [ val := true ]
		ifNone: [ val := false ].
	self assert: val