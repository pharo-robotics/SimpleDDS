initialization
initialize
	super initialize.
	participantServers := Set new.
	portResolver  := MDDSPortResolver obtain.
	registeredTopics := Set new