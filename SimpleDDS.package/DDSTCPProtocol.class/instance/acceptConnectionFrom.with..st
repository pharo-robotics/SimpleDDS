as yet unclassified
acceptConnectionFrom: aSocketListener with: aConnectionOffer
	| socket stream |
	socket := nil.
	[ socket isNil ] whileTrue: [ socket := aSocketListener waitForAcceptFor: 10 ].
	stream := SocketStream on: socket.
	stream binary.
	self shakeHandsWith: socket and: stream accordingTo: aConnectionOffer.
	self flag: #performance.	" this creation may be good to be done in the connection offer, to have different kind of writing connections per kind of topic it may be good. Check in the MDDSWritingConnection performance flag."
	^ MDDSWritingNetworkConnection with: self for: socket