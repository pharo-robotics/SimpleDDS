Extension { #name : #MacOSPlatform }

{ #category : #'*SimpleDDS' }
MacOSPlatform >> resolveIp [

	| ipStream ip |
	ipStream := (LibC resultOfCommand: 'ifconfig') readStream.
	[ ipStream atEnd ] whileFalse: [ 
		ipStream upToAll: 'inet '.
		ip := ipStream upToAll: ' '.
		ip = '127.0.0.1' ifFalse: [ 
			($. split: ip) size = 4 ifTrue: [ ^ ip ] ] ].
	^ nil
]
