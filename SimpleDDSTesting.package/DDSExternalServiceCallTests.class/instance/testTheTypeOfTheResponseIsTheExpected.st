as yet unclassified
testTheTypeOfTheResponseIsTheExpected
	| response |
	service serve: [ :rq :rp | rp data: rq data ] for: participant.
	caller := service callerFor: participant.
	response := caller call: [ :s |  ].
	self assert: (response isKindOf: (Smalltalk at: #Service_type_AdhocResponse))