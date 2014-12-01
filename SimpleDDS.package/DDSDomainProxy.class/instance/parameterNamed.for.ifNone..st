as yet unclassified
parameterNamed: aParameterName for: aParticipantMirror ifNone: aBlock
	| val |
	val := nil.
	[ val := proxy getParam: aParameterName for: aParticipantMirror name ]
		on: Error
		do: [ :e | ^ aBlock value ].
	val ifNil: [ ^ aBlock value ].
	proxy
		subscribeParam: aParameterName
		callingBack: (self uriFor: aParticipantMirror)
		for: aParticipantMirror participant name.
	^ DDSBindedParameter name: aParameterName participant: aParticipantMirror participant initialized: val