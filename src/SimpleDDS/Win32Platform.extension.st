Extension { #name : #Win32Platform }

{ #category : #'*SimpleDDS' }
Win32Platform >> resolveIp [

	| ipStream ip |
	ipStream := (LibC resultOfCommand: 'ipconfig') readStream.
	ipStream upToAll:'Wireless LAN adapter Wi-Fi:'.
	[ ipStream atEnd ] whileFalse: [ 
		ipStream upToAll: 'IPv4 Address. . . . . . . . . . . : '.
		ip := ipStream upToAll: String cr.
		ip = '127.0.0.1' ifFalse: [ 
			($. split: ip) size = 4 ifTrue: [ ^ ip ] ] ].
	^ nil
]
