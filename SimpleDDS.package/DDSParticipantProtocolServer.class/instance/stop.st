accessing
stop
	| proc |
	listener destroy.
	proc := process.
	process := nil.
	proc stop.
	participant := nil.
	^ self