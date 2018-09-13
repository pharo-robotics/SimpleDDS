parameters
createOrObtainTypeContainer: aRegistryName for: aTypeLoader
	| value |
	[ value := proxy getParam: aTypeLoader name named: aRegistryName ]
		on: Error
		do: [ 
			value := Dictionary new.
			proxy setParam: aTypeLoader name named: aRegistryName with: value ].
	proxy subscribeParam: aTypeLoader name callingBack: aTypeLoader uri forParameter: aRegistryName.
	^ value