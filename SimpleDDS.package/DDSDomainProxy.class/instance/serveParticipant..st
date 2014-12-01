as yet unclassified
serveParticipant: aParticipantMirror
	(self itIsBeingServed: aParticipantMirror)
		ifFalse: [ 
			| server |
			server := self createServerFor: aParticipantMirror.
			server port: self obtainPort.
			server serve.
			self registerExposure: server ].
	^ aParticipantMirror