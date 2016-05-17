parameters
parameterNamed: aParameterName for: aParticipantMirror ifNone: aBlock
	| val |
	val := nil.
	[ val := proxy getParam: aParticipantMirror name named: aParameterName ]
		on: Error
		do: [ :e | ^ aBlock value ].
	val ifNil: [ ^ aBlock value ].
	proxy
		subscribeParam: aParticipantMirror participant name
		callingBack: (self uriFor: aParticipantMirror)
		forParameter: aParameterName.
	^ DDSBindedParameter name: aParameterName participant: aParticipantMirror participant initialized: val