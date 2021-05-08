Extension { #name : #MacOSPlatform }

{ #category : #'*SimpleDDS' }
MacOSPlatform >> interfaces [

	^ (' ' split: (LibC resultOfCommand: 'ifconfig -l')) collect: [ :i | 
		DDSNetworkInterface new name: i ]
]

{ #category : #'*SimpleDDS' }
MacOSPlatform >> resolveIpInto: anInterface [

	| ipLines |
	ipLines := (LibC resultOfCommand:
		            ('ifconfig {1}' format: { anInterface name })) lines.
	
	(ipLines first beginsWith: 'ifconfig:' ) ifTrue: [ ^ anInterface setInvalid: true ].
	ipLines detect: [ :l | (l indexOfSubCollection: 'inet ') > 0 ] ifFound: [ :l | 
		| stream |
		stream := l readStream.
		stream upToAll: 'inet '.
		anInterface ipV4: (stream upToAll: ' ').
		stream upToAll: 'netmask'.
		anInterface ipV4Mask: stream upToEnd ].

	ipLines
		detect: [ :l | 
		(l indexOfSubCollection: 'inet6') > 0 and: [ (l indexOfSubCollection: '%') > 0 ] ]
		ifFound: [ :l | 
			| stream |
			stream := l readStream.
			stream upToAll: 'inet6'.
			anInterface ipV6: (stream upToAll: ' ') ].
]
