unimplemented
setParam: aCallerId named: aParameterName with: anObject
	(parameters lookupOrCreateParameterInPath: (DDSSParameterPath fromRos: aCallerId and: aParameterName)) value: anObject.
	^ true