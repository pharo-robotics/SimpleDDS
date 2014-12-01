ros-xml-reponses
requestTopic: aCallerId for: aTopicName availableFor: anArrayOfProtocols
	| relatedServers selected |
	relatedServers := (participantMirror publicationForTopicNamed: aTopicName) publicationServers.
	selected := anArrayOfProtocols
		inject: Set new
		into: [ :set :protocol | 
			relatedServers detect: [ :server | server supports: (protocol at:1) ] ifFound: [ :server | set add: server ] ifNone: [  ].
			set ].
	^ {1.
	'Protocols'.
	((selected
		collect: [ :server | 
			{(server protocol name).
			(NetNameResolver stringFromAddress: server ip).
			(server port)} ]) anyOne asArray)}