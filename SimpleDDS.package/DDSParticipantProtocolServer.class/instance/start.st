accessing
start
	listener
		ifNil:
			[ 
			listener := protocol createSocketForlistenAt: ip on: port.
			process := process := (self -> #spinOnce) tkt
				loopingService;
				inALocalProcess;
				onServiceFinalization: [ self halt ] onFailure: [ :err | self halt ];
				start ]