as yet unclassified
call: aBlockClosure
	| request |
	
 	self isConnected
		ifFalse: [ self scanForServersIfNone: [ MDDSError signal: 'The service is not connected' ] ].
	service type isTypePlaceHolder
		ifTrue: [ MDDSError signal: 'The service type is not correctly defined' ].
	request := service type requestMarshaller newInstance.
	aBlockClosure value: request.
	^ self invokeWith: request