Extension { #name : #Win32Platform }

{ #category : #'*SimpleDDS' }
Win32Platform >> interfaces [
	| ipLines |
	ipLines := (LibC resultOfCommand: 'netsh interface ip show interface')
		lines.
	ipLines := ipLines copyFrom: 4 to: ipLines size.
	ipLines := ipLines select: [ :l | l isNotEmpty ].
	^ (ipLines collect: [ :l | ('  ' split: l) last trimBoth ])
		collect: [ :n | 
			DDSNetworkInterface new
				name: n;
				yourself ]
]

{ #category : #'*SimpleDDS' }
Win32Platform >> resolveIpInto: aDDSNetworkInterface [
	| ipLines ipv4 |
	ipLines := (LibC
		resultOfCommand:
			('netsh interface ip show addresses "{1}"'
				format: {aDDSNetworkInterface name})) lines
		select: [ :i | i isNotEmpty ].
	ipLines size = 1
		ifTrue: [ aDDSNetworkInterface setInvalid: true.
			^ self ].
	ipLines
		detect: [ :l | l includesSubstring: 'IP ' ]
		ifFound: [ :l | 
			ipv4 := (':' split: l) second trimBoth.
			aDDSNetworkInterface ipV4: ipv4 ].
	ipLines
		detect: [ :l | l includesSubstring: 'Subnet ' ]
		ifFound: [ :l | 
			| stream |
			stream := l readStream.
			stream
				upToAll: '(';
				upToAll: ' '.
			aDDSNetworkInterface ipV4Mask: (stream upToAll: ')') trimBoth ]
]
