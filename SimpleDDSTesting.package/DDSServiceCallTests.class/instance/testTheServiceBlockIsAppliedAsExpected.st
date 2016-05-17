as yet unclassified
testTheServiceBlockIsAppliedAsExpected
	| response |
	service serve: [ :rq :rp | rp data: rq data ] for: participant.
	caller := service callerFor: participant.
	response := caller call: [ :rq | rq data: 'test' ].
	self assert: response data equals: 'test'