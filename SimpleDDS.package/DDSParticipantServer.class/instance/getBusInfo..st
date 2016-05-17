ros-xml-reponses
getBusInfo: aCallerID
	^ {1.
	' Bus Info '.
	((participantMirror relatedConnections
		collect: [ :conn | 
			{(conn id).
			(conn urlrpc).
			(conn isReader
				ifTrue: #i
				ifFalse: #o).
			(conn protocol name).
			"(conn topic name)."
			(conn isConnected)} ]) asArray)}