as yet unclassified
getParamNames: aCallerId
	^ (parameters lookupParameterInPath: (DDSSParameterPath fromRos: aCallerId )) names asArray