accessing
start
	process
		ifNil: [ "Priority 60."
			process := TKTParameterizableService new.
			process
				onSetUpDo:
					(MessageSend
						receiver: self
						selector: #logCr:
						argument: 'DDS System monitor has started').
			process
				onTearDownDo: [ self traceCr: 'DDS System monitor has finished' ].
			process name: ' Service Monitor ' , UUID new asString.
			process step: (MessageSend receiver: self selector: #monitor).
			process start ]