as yet unclassified
hasLocalServers
	^ servers isEmpty not and: [ servers anySatisfy: #isLocalServer ]