service
shutdown: aCallerID cause: aCause
	^ self
		invokeMethod: 'shutdown'
		withArgs:
			{aCallerID.
			aCause}