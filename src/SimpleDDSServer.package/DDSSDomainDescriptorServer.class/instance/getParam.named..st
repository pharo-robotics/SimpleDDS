as yet unclassified
getParam: aCallerId named: aParameterName
	^ (parameters lookupParameterInPath: (DDSSParameterPath fromRos: aCallerId and: aParameterName)) value