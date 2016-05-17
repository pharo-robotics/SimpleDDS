as yet unclassified
shakeHandsForAcceptWith: aSocket and: aStream accordingTo: aSetOfPetitionHandlers
	| rawdata receivedHeader handlers |
	" Recv connection headers "
	receivedHeader := self headerProtocol loadStream: aStream with: self header.
	handlers := (aSetOfPetitionHandlers select: [ :h | h validateAndProcessHeader: receivedHeader ])
		asOrderedCollection.
	handlers isEmpty
		ifTrue: [ 
			aStream close.
			self error: 'Invalid header!' ].
	" Send connection headers "
	rawdata := self headerProtocol
		dump: (self header newInstance loadFrom: handlers first)
		with: self header.
	aSocket sendData: rawdata.
	^ receivedHeader probe = 1
		ifTrue: [  ]
		ifFalse:
			[ 
			handlers first
				createConnectionFor: self
				on: aSocket
				and: aStream
				for: receivedHeader callerId ]