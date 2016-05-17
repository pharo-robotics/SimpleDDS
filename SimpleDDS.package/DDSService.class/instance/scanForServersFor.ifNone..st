as yet unclassified
scanForServersFor: aParticipant ifNone: aBlock
	domain lookupAndRegisterServiceServerFor: aParticipant forCalling: self.
	self hasServers
		ifFalse: [ aBlock value ]