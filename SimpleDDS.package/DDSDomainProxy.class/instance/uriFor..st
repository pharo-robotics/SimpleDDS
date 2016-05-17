abstract
uriFor: aParticipantMirror
	^ 'http://{1}:{2}/'
		format:
			{ NetNameResolver stringFromAddress: aParticipantMirror ip .
			((self participantServerFor: aParticipantMirror) port)}