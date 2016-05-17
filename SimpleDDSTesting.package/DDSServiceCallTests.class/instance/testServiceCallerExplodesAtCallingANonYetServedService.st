as yet unclassified
testServiceCallerExplodesAtCallingANonYetServedService
	caller := service callerFor: participant.
	self should: [ caller call: [ :req |  ] ] raise: MDDSError