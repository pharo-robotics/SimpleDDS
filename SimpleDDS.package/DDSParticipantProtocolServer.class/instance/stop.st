accessing
stop
	| proc |
	listener destroy.
	proc := process.
	process := nil.
	proc cancel.
	participant := nil.
	^ self