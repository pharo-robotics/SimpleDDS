run
startServers
	servers isEmptyOrNil
		ifTrue:
			[ 
			servers := self protocols
				collect: [ :protocol | 
					DDSParticipantProtocolServer
						startOn: self ip
						at: (self obtainPortFor: protocol)
						for: protocol
						participant: self ] ].