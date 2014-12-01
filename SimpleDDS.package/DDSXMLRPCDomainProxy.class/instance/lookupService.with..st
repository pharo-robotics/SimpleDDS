API
lookupService: serviceName with: aCallerId
	^ self
		invokeMethod: 'lookupService'
		withArgs:
			{aCallerId.
			serviceName}