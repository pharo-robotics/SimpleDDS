example pieces
exampleParameter
	" You may want to run this example from #runExample "

	| domain participant parameter |
	domain := self createExampleDomain.
	participant := MDDSDomainParticipant domain: domain name: 'participant' , UUID new asString ip: '127.0.0.1'.
	parameter := domain createParameterNamed: 'parameter' for: participant.
	parameter set: 10.
	Transcript show:' Starting loop with ', parameter get asString; cr.
	parameter get
		timesRepeat: [ 
			Transcript show:'Value', participant name, ' ' , parameter get asString  ; cr.
			parameter set: parameter get + 1.
			500 milliSeconds wait.
			
	].

	domain destroy.