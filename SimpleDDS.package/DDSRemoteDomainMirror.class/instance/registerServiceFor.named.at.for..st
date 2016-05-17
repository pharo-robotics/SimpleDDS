as yet unclassified
registerServiceFor: aCallerId named: serviceName at: aROSRPCUrl for: aXMLRPCUrl
	^ proxy
		registerServiceFor: aCallerId
		named: serviceName
		at: aROSRPCUrl
		for: aXMLRPCUrl