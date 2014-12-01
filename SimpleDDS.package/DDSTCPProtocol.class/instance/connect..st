as yet unclassified
connect: aMDDSConnectionPetition
	| socket stream |
	socket := Socket newTCP.
	stream := SocketStream on: socket.
	stream binary.
	socket connectTo: (NetNameResolver addressFromString: aMDDSConnectionPetition ip) port: aMDDSConnectionPetition port.
	self shakeHandsWith: socket and: stream accordingTo: aMDDSConnectionPetition.
	^ MDDSReadingNetworkConnection protocol: self socket: socket stream: stream