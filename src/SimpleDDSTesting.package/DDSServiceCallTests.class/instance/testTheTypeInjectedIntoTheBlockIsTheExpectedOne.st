as yet unclassified
testTheTypeInjectedIntoTheBlockIsTheExpectedOne
	| request |
	service serve: [ :rq :rp | rp data: rq data ] for: participant.
	caller := service callerFor: participant.
	caller call: [ :s | request := s ].
	self assert: (request isKindOf: (Smalltalk at: #Service_type_AdhocRequest))