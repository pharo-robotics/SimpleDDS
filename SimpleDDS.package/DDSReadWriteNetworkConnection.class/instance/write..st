as yet unclassified
write: aDataValue
	^ socket
		sendData:
			(isAServerSideConnection
				ifTrue: [ {1. } ]
				ifFalse: [ {} ]) asByteArray , (protocol dump: aDataValue with: outputMarshaller)