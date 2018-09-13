registration
registerConnectionOffer: aConnectionOffer
	self offers add: aConnectionOffer.
	self offers size = 1 ifTrue: [ self startServers ]