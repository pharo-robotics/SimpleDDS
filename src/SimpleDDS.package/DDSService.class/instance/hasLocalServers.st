as yet unclassified
hasLocalServers
	^ servers isNotEmpty and: [ servers anySatisfy: #isLocalServer ]