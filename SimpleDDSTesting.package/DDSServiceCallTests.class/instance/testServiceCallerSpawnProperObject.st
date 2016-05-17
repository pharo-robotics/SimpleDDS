as yet unclassified
testServiceCallerSpawnProperObject
	caller := service callerFor: participant.
	self assert: (caller isKindOf: DDSServiceCaller)