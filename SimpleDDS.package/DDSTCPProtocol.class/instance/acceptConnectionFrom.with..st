as yet unclassified
acceptConnectionFrom: aSocketListener with: aSetOfOffers
	| socket stream |
	socket := nil.
	[ socket isNil ]
		whileTrue: [ socket := aSocketListener waitForAcceptFor: 10 ].
	stream := SocketStream on: socket.
	stream binary.
	self flag: #performance.	" this creation may be good to be done in the connection offer, to have different kind of writing connections per kind of topic it may be good. Check in the MDDSWritingConnection performance flag."
	^ self
		shakeHandsForAcceptWith: socket
		and: stream
		accordingTo: aSetOfOffers