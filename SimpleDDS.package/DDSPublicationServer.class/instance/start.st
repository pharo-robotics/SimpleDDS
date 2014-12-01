accessing
start
	listener
		ifNil: [ 
			listener := protocol createSocketForlistenAt: ip on: port.
			keepRunning := true.
			process := [ self run ] shootIt asStickyReference ]