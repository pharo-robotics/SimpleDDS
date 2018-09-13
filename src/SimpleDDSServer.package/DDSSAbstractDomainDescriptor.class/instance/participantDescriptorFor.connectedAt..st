as yet unclassified
participantDescriptorFor: aName connectedAt: anUri
	^ participants detect: [ : p | p name = aName  ] ifNone: [ 
		| participant |
		participant := self constructParticipantDescriptorNamed: aName connectedAt: anUri.
		participants add: participant.
		participant.
	 ]