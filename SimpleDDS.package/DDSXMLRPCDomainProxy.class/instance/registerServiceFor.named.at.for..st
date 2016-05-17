API
registerServiceFor: aCallerId named: serviceName at: aROSRPCUrl for: aXMLRPCUrl 
	^ self
		invokeMethod: 'registerService'
		withArgs:
			{aCallerId.
			serviceName.
			aROSRPCUrl.
			aXMLRPCUrl}