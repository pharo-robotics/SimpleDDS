as yet unclassified
getParam: aCallerId for: aParameterName
	^ (parameters lookupParameterInPath: (DDSParameterPath fromRos: aCallerId and: aParameterName)) value