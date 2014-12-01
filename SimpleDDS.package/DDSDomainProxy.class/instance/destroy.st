as yet unclassified
destroy
	super destroy.
	registeredTopics removeAll.
	typeLoader ifNotNil: [ typeLoader unload ].
	proxy := nil.
	participantServers do: #destroy.
	participantServers removeAll