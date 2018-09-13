as yet unclassified
deleteParam: aCallerId named: aParameterName
	^ (parameters lookupParameterInPath: (DDSSParameterPath fromRos: aCallerId and: aParameterName)) delete.