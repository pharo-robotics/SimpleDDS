accessing
start
	listener
		ifNil: [ listener := protocol createSocketForlistenAt: ip on: port.
			process := TKTParameterizableService new.
			process onSetUpDo: (MessageSend receiver: self selector: #logCr: argument: 'Participant protocol server started').
			process
				onTearDownDo: [ self logCr: 'Participant protocol server finished'.
					self halt ].
			process step: (MessageSend receiver: self selector: #spinOnce).
			process name: participant name, ' ', protocol name ,  ' protocol server ', UUID new asString.
			process start ]