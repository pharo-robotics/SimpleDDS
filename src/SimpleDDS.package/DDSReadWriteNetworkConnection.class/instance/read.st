accessing
read
	isAServerSideConnection
		ifFalse:
			[ self isError
				ifTrue:
					[ DDSServiceCallFailed signal: 'Remote error executing the called service'.
					^ self ] ].
	^ protocol loadStream: stream with: inputMarshaller