registration
unregisterConnectionOffer: aConnectionOffer
	offers remove: aConnectionOffer.
	offers isEmpty ifTrue: [ self stopServers ]