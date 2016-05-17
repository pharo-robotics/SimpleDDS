as yet unclassified
shakeHandsWith: aSocket and: aStream accordingTo: aMDDSConnectionPetition
	| rawdata receivedHeader |
	" Send connection headers "
	rawdata := self headerProtocol
		dump:
			(self header newInstance loadFrom: aMDDSConnectionPetition)
		with: self header.
	aSocket sendData: rawdata.	" Recv connection headers "
	receivedHeader := self headerProtocol
		loadStream: aStream
		with: self header.
	(aMDDSConnectionPetition validateAndProcessHeader: receivedHeader)
		ifFalse: [ self error: 'Invalid header!' ].
	^ aMDDSConnectionPetition
		createConnectionFor: self
		on: aSocket
		and: aStream
		for: receivedHeader callerId