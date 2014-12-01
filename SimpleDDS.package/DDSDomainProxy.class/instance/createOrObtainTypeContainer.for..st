parameters
createOrObtainTypeContainer: aRegistryName for: aTypeLoader
	| value |
	[ value := proxy getParam: aRegistryName for: aTypeLoader name ]
		on: Error
		do: [ 
			value := Dictionary new.
			proxy setParam: aTypeLoader name named: aRegistryName with: value ].
	proxy subscribeParam: aRegistryName callingBack: aTypeLoader uri for: aTypeLoader name.
	^ value