run
start
	process
		ifNil: [ 
			process := (self -> #monitor) tkt
				loopingService;
				inALocalProcess;
				start ]
			
		"Priority 60."