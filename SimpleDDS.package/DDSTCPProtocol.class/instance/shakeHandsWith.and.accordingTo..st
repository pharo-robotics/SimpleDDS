as yet unclassified
shakeHandsWith: aSocket and: aStream accordingTo: aMDDSConnectionPetition
	| rawdata recv |
	" Send connection headers "
	rawdata := self headerProtocol dump: (self header newInstance loadFrom: aMDDSConnectionPetition) with: self header.
	aSocket sendData: rawdata.	" Recv connection headers "
	recv := self headerProtocol loadStream: aStream with: self header.
	(aMDDSConnectionPetition validateAndProcessHeader: recv)
		ifFalse: [ self error: 'Invalid header!' ]