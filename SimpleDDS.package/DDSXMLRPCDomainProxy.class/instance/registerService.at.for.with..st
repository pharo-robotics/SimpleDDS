API
registerService: serviceName at: aROSRPCUrl for: aXMLRPCUrl with: aCallerId
	^ self
		invokeMethod: 'registerService'
		withArgs:
			{aCallerId.
			serviceName.
			aROSRPCUrl.
			aXMLRPCUrl}