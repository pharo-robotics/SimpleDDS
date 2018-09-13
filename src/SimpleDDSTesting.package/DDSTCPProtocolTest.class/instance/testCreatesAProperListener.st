as yet unclassified
testCreatesAProperListener
	| socket |
	socket  := tcpProtocol createSocketForlistenAt: (NetNameResolver addressFromString: '127.0.0.1') on: (MDDSPortResolver new obtainPort). 
	self assert: socket isWaitingForConnection.
	self assert: (socket isKindOf:Socket).
	socket close.
	socket destroy.