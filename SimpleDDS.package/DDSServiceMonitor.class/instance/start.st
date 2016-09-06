accessing
start
	process
		ifNil: [ process := TKTParameterizableService new.
			process onSetUpDo: (MessageSend receiver: self selector: #logCr: argument: 'DDS System monitor has started').
			process
				onTearDownDo: [ self logCr: 'DDS System monitor has finished'.
					self halt ].
			process step: (MessageSend receiver: self selector: #monitor).
			process start ]

	"Priority 60."