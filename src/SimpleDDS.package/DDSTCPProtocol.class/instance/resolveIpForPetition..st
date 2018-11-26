as yet unclassified
resolveIpForPetition: aDDSServiceConnectionPetition
	^ NetNameResolver
		addressFromString:
			((aDDSServiceConnectionPetition ip = NetNameResolver localHostName
				or: [ aDDSServiceConnectionPetition ip = #localhost ])
				ifTrue: [ NetNameResolver localAddressString ]
				ifFalse: [ aDDSServiceConnectionPetition ip ])