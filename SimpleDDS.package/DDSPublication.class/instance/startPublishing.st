accessing
startPublishing
	servers := participant protocols
		collect: [ :protocol | 
			DDSPublicationServer
				startOn: participant ip
				at: (participant obtainPortFor: protocol)
				for: protocol
				offering: connectionOffer
				onNewClient: [ :writingConnection | self register: writingConnection ] ]