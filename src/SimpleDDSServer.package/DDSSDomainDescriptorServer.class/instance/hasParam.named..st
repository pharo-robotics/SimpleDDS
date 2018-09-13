as yet unclassified
hasParam: aCallerId named: aParameterName
	^ (parameters lookupParameterInPath: (DDSSParameterPath fromRos: aCallerId and: aParameterName)) value isNotNil