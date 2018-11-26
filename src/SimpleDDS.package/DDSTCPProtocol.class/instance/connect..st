as yet unclassified
connect: aMDDSConnectionPetition
	| socket stream |
	socket := Socket newTCP.
	stream := SocketStream on: socket.
	stream binary.
	socket
		connectTo: (self resolveIpForPetition: aMDDSConnectionPetition)
		port: aMDDSConnectionPetition port.
	^ self shakeHandsWith: socket and: stream accordingTo: aMDDSConnectionPetition