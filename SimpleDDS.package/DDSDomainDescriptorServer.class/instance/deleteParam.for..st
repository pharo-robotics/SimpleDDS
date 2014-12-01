as yet unclassified
deleteParam: aCallerId for: aParameterName
	^ (parameters lookupParameterInPath: (DDSParameterPath fromRos: aCallerId and: aParameterName)) delete.