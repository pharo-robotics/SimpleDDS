API
lookupNode: nodeName with: aCallerId
	^ self
		invokeMethod: 'lookupNode'
		withArgs:
			{aCallerId.
			nodeName}